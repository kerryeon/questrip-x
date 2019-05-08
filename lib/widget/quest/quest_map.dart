import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:questrip/controller/quest/quest_map.dart';
import 'package:questrip/widget/quest/quest_menu.dart';
import 'package:questrip/widget/quest/quest_view.dart';

/// 메인화면을 담당하는 클래스입니다.
/// 배경에는 지도를 띄워 퀘스트 마커를 보이게 합니다.
/// 메뉴 탭에는 내 퀘스트 목록, 환경설정이 보이게 합니다.
/// 마커를 터치하면 퀘스트 정보가 보이게 합니다.
///
/// 담당자: 김호, 이동욱, 구본근
///
class QuestMapState extends State<QuestMapWidget> {

  final QuestMapController _controller = QuestMapController();

  /// 창을 구성합니다.
  List<Widget> get stack {
    List<Widget> result = [
      GoogleMap(
        initialCameraPosition: _controller.kPositionInit,
        mapType: MapType.normal,
        markers: _controller.markers,
        onMapCreated: (c) => _controller.initMap(c, setState),
        onCameraIdle: _controller.updateMarkers,
        compassEnabled: false,
        myLocationEnabled: false,
        onTap: (_) => _controller.closeAll(),
      ),
      Container(
          margin: const EdgeInsets.only(top: 32, left: 16,),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: new BorderRadius.all(Radius.circular(8.0)),
          ),
          child: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: _controller.openMenu,
          )
      ),
    ];
    // 퀘스트 정보창
    if (_controller.questViewController.visible)
      result.add(
          Positioned(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: QuestViewWidget(_controller.questViewController),
              )
          ));
    // 메뉴창
    if (_controller.questMenuController.visible)
      result.add(
          Positioned(
              child: Align(
                alignment: FractionalOffset.topLeft,
                child: QuestMenuWidget(_controller.questMenuController),
              )
          ));
    return result;
  }

  @override
  Widget build(BuildContext context) {
    _controller.init(context);
    return Scaffold(
        body: WillPopScope(
            onWillPop: _controller.onBackPressed,
            child: Stack(
                children: stack,
            )
        )
    );
  }
}

class QuestMapWidget extends StatefulWidget {

  @override
  State<QuestMapWidget> createState() => QuestMapState();

}
