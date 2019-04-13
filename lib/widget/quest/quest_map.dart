import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:questrip/controller/quest/quest_map_controller.dart';
import 'package:questrip/widget/common/alert.dart';

/// 메인화면을 담당하는 클래스입니다.
/// 배경에는 지도를 띄워 퀘스트 마커를 보이게 합니다.
/// 메뉴 탭에는 내 퀘스트 목록, 환경설정이 보이게 합니다.
/// 마커를 터치하면 퀘스트 정보가 보이게 합니다.
///
/// 담당자: 김호, 이동욱, 구본근
///
class QuestMapState extends State<QuestMapWidget> {

  final QuestMapController _manager = QuestMapController();

  @override
  Widget build(BuildContext context) {
    _manager.init(context);
    return Scaffold(
        body: WillPopScope(
            onWillPop: () => dialogExit(context),
            child: GoogleMap(
              initialCameraPosition: _manager.kPositionInit,
              mapType: MapType.normal,
              markers: _manager.markers,
              onMapCreated: (c) => _manager.initMap(c, setState),
              onCameraIdle: _manager.updateMarkers,
              compassEnabled: false,
              myLocationEnabled: false,
            ))
    );
  }

}

class QuestMapWidget extends StatefulWidget {
  @override
  State<QuestMapWidget> createState() => QuestMapState();
}
