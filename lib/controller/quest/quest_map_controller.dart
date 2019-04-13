import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:questrip/data/quest.dart';
import 'package:questrip/lib.dart';
import 'package:questrip/controller/lib.dart';
import 'package:questrip/controller/quest/quest_map_marker.dart';
import 'package:questrip/net/client.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

/// 메인화면의 동작을 담당합니다.
///
/// 담당자: 김호
///
class QuestMapController extends IController {

  static const double _ZOOM_RATING = 7.25;
  static const double _ZOOM_DISTANCE = 8.25;

  final Completer<GoogleMapController> _controller = Completer();
  final Completer<void Function(Runnable)> _setState = Completer();
  final Set<Marker> markers = <Marker>{};

  List<Quest> quests;

  /// 맵뷰를 초기화합니다.
  void initMap(
      final GoogleMapController controller,
      void Function(Runnable) setState) async {
    _controller.complete(controller);
    _setState.complete(setState);
    _tryShowMyLocation();
    _tryLoadQuests();
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

  /// 퀘스트 목록을 불러옵니다.
  /// 만약 실패하면, 그 이유를 알려줍니다.
  void _tryLoadQuests() async => request(
      R.uri.meQuest, _onLoadQuests,
      (e) => dialogFailed(context, e)
  );

  /// 퀘스트 목록을 성공적으로 불러온 경우의 이벤트입니다.
  void _onLoadQuests(final Map<String, Object> response) async {
    final List<Object> raw = response['list'];
    quests = raw.map((q) => Quest.fromJSON(q)).toList();
    quests.sort(Quest.compareRating);
    updateMarkers();
    _tryShowMyLocation();
  }

  /// 마커를 다시 그립니다.
  void updateMarkers() async {
    if (quests == null) return;
    // 기존의 마커는 모두 지웁니다.
    _removeMarkers();
    // 새로 그립니다.
    (await _questsInCamera).forEach(_addMarker);
    // 화면을 갱신합니다.
    _updateState();
  }

  /// 현재 화면에 보일 수 있는 퀘스트를 선출합니다.
  Future<Iterable<Quest>> get _questsInCamera async {
    final GoogleMapController controller = await _controller.future;
    // 현재 화면 영역 (사각형)을 구합니다.
    final LatLngBounds bounds = await controller.getVisibleRegion();
    // 현재 화면에 속하는 퀘스트를 추출합니다.
    // 그중, 인기가 높은 몇몇 퀘스트만 추출합니다.
    return quests.where((q) => bounds.contains(q.latLng)).take(10);
  }

  /// 마커를 하나 그립니다.
  void _addMarker(final Quest quest) async =>
      markers.add(QuestMapMarker.fromQuest(quest, () => print('tapped')));

  /// 마커를 모두 지웁니다.
  void _removeMarkers() => markers.clear();

  /// 화면을 갱신합니다.
  void _updateState() async {
    final void Function(Runnable) setState = await _setState.future;
    setState(() {});
  }

  /// 맵뷰가 처음 보여줄 위치를 반환합니다.
  CameraPosition get kPositionInit => CameraPosition(
    target: LatLng(36.4163582, 127.8121624),
    zoom: _ZOOM_RATING,
  );

}
