import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:questrip/controller/quest/quest_map/quest_map.dart';
import 'package:questrip/widget/quest/quest_about.dart';
import 'package:questrip/widget/quest/quest_menu.dart';
import 'package:questrip/widget/shop/shop_about.dart';
import 'package:questrip/res/lib.dart';

/// 메인화면을 담당하는 클래스입니다.
/// 배경에는 지도를 띄워 퀘스트 마커를 보이게 합니다.
/// 메뉴 탭에는 내 퀘스트 목록, 환경설정이 보이게 합니다.
/// 마커를 터치하면 퀘스트 정보가 보이게 합니다.
///
/// 담당자: 김호, 이동욱, 구본근
///
class QuestMapState extends State<QuestMapWidget> with TickerProviderStateMixin {

  final QuestMapController _controller = QuestMapController();

  @override
  void initState() {
    super.initState();
    _controller.initAnimation(this);
  }

  @override
  Widget build(BuildContext context) {
    _controller.init(context);
    return Scaffold(
        body: WillPopScope(
            onWillPop: _controller.onBackPressed,
            child: Stack(
                children: <Widget>[

                  // 지도 레이아웃
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

                  // 보기 모드 전환 버튼
                  Container(
                    margin: EdgeInsets.all(16.0),
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                        child: Icon(_controller.isModeQuests
                            ? Icons.airplanemode_active
                            : Icons.shopping_cart),
                      onPressed: _controller.switchMode,
                      heroTag: R.string.quest_map_button_menu,
                    ),
                  ),

                  // 메뉴 버튼
                  Container(
                      margin: EdgeInsets.all(16.0),
                      alignment: Alignment.topLeft,
                      child: FloatingActionButton(
                        child: Icon(Icons.menu),
                        onPressed: _controller.openMenu,
                      )
                  ),

                  // 퀘스트 정보창
                  Positioned(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: SlideTransition(
                          position: _controller.questAboutController.offset,
                          child: QuestAboutWidget(_controller.questAboutController),
                        ),
                      )
                  ),

                  // 상점 정보창
                  Positioned(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: SlideTransition(
                          position: _controller.shopAboutController.offset,
                          child: ShopAboutWidget(_controller.shopAboutController),
                        ),
                      )
                  ),

                  // 메뉴창
                  Positioned(
                      child: Align(
                        alignment: FractionalOffset.topLeft,
                        child: SlideTransition(
                          position: _controller.questMenuController.offset,
                          child: QuestMenuWidget(_controller.questMenuController),
                        ),
                      )
                  ),

                ],
            )
        )
    );
  }
}

class QuestMapWidget extends StatefulWidget {

  @override
  State<QuestMapWidget> createState() => QuestMapState();

}
