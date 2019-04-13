import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:questrip/manager/lib.dart';
import 'package:questrip/net/client.dart';
import 'package:questrip/res/lib.dart';

/// 메인화면의 동작을 담당합니다.
///
/// 담당자: 김호
///
class QuestMapManager extends Manager {

  static const double _ZOOM_RATING = 7.25;
  static const double _ZOOM_DISTANCE = 8.25;

  Completer<GoogleMapController> _controller = Completer();

  /// 맵뷰를 초기화합니다.
  void initMap(GoogleMapController controller) async {
    _controller.complete(controller);
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
  void _tryLoadQuests() async {
    // request(R.uri.meQuest, )
    // TODO to be implemented.
  }

  /// 맵뷰가 처음 보여줄 위치를 반환합니다.
  CameraPosition get kPositionInit => CameraPosition(
    target: LatLng(36.4163582, 127.8121624),
    zoom: _ZOOM_RATING,
  );

}
