import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:questrip/controller/lib.dart';
import 'package:questrip/controller/quest/quest_about.dart';
import 'package:questrip/controller/quest/quest_menu.dart';
import 'package:questrip/controller/shop/shop_main.dart';
import 'package:questrip/data/marker.dart';
import 'package:questrip/data/quest.dart';
import 'package:questrip/data/shop.dart';
import 'package:questrip/lib.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

/// 메인화면의 동작을 담당합니다.
///
/// 담당자: 김호
///
abstract class IQuestMapController extends IController {

  final QuestAboutController questAboutController = QuestAboutController();
  final QuestMenuController questMenuController = QuestMenuController();
  final ShopAboutController shopAboutController = ShopAboutController();

  static const double _ZOOM_RATING = 7.25;
  static const double _ZOOM_DISTANCE = 8.25;
  static const int    _MAX_VIEW = 8;

  final Completer<GoogleMapController> _controller = Completer();
  final Completer<void Function(Runnable)> _setState = Completer();
  /// 마커 목록입니다.
  final Set<Marker> markers = {};

  @protected
  List<IMarker> markersData;

  /// 맵뷰를 초기화합니다.
  void initMap(
      final GoogleMapController controller,
      void Function(Runnable) setState) async {
    _controller.complete(controller);
    _setState.complete(setState);
    _tryShowMyLocation();
  }

  /// 마커를 다시 그립니다.
  void updateMarkers() async {
    if (markersData == null) return;
    // 기존의 마커는 모두 지웁니다.
    _removeMarkers();
    // 새로 그립니다.
    (await _whereInCamera).forEach(_addMarker);
    // 화면을 갱신합니다.
    updateState();
  }

  /// 메뉴창을 엽니다.
  void openMenu() {
    _closeAbout();
    questMenuController.show();
    updateState();
  }

  /// 메뉴창과 퀘스트 정보창을 닫습니다.
  void closeAll() {
    _closeMenu();
    _closeAbout();
    updateState();
  }

  /// 사용자가 뒤로가기 버튼을 누른 경우의 이벤트입니다.
  /// 메뉴창, 퀘스트 정보창을 닫거나,
  /// 혹은 앱을 종료할 것인지 물어봅니다.
  Future<bool> onBackPressed() async {
    if (questAboutController.visible
        || questMenuController.visible
        || shopAboutController.visible)
      closeAll();
    else return dialogExit(context);
    return false;
  }

  /// 현재 위치를 보여줍니다.
  /// 만약 실패하면, 아무 일도 일어나지 않습니다.
  void _tryShowMyLocation() async {
    final LocationData currentLocation = await R.location.getLocation();
    final CameraPosition currentPosition = CameraPosition(
      target: LatLng(currentLocation.latitude, currentLocation.longitude),
      zoom: _ZOOM_DISTANCE,
    );
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(currentPosition));
  }

  /// 현재 화면에 보일 수 있는 퀘스트를 선출합니다.
  Future<Iterable<IMarker>> get _whereInCamera async {
    final GoogleMapController controller = await _controller.future;
    // 현재 화면 영역 (사각형)을 구합니다.
    final LatLngBounds bounds = await controller.getVisibleRegion();
    // 현재 화면에 속하는 퀘스트를 추출합니다.
    // 그중, 인기가 높은 몇몇 퀘스트만 추출합니다.
    return markersData.where((q) => bounds.contains(q.latLng)).take(_MAX_VIEW);
  }

  /// 마커를 하나 그립니다.
  void _addMarker(final IMarker marker) async =>
      markers.add(await marker.toMarker(_onTouchMarker));

  /// 마커를 모두 지웁니다.
  void _removeMarkers() => markers.clear();

  /// 화면을 갱신합니다.
  @protected
  void updateState() async {
    final void Function(Runnable) setState = await _setState.future;
    setState(() {});
  }

  /// 마커를 터치한 경우의 이벤트입니다.
  /// 메뉴창을 닫고, 퀘스트 설명창을 보여줍니다.
  void _onTouchMarker(final IMarker marker) {
    _closeMenu();
    if (marker is Quest) questAboutController.showAbout(marker);
    else if (marker is Shop) shopAboutController.showAbout(marker);
  }

  /// 메뉴창을 닫습니다.
  void _closeMenu() => questMenuController.hide();

  /// 퀘스트 설명창을 닫습니다.
  void _closeAbout() {
    questAboutController.hide();
    shopAboutController.hide();
  }

  /// 맵뷰가 처음 보여줄 위치를 반환합니다.
  CameraPosition get kPositionInit => CameraPosition(
    target: LatLng(36.4163582, 127.8121624),
    zoom: _ZOOM_RATING,
  );

}
