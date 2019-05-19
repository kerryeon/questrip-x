import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:questrip/controller/quest/quest_map/interface.dart';
import 'package:questrip/controller/quest/quest_map/quest.dart';
import 'package:questrip/controller/quest/quest_map/shop.dart';
import 'package:questrip/lib.dart';

class QuestMapController extends IQuestMapController
    with IQuestMapQuestsController, IQuestMapShopsController {

  /// 애니메이션을 초기화합니다.
  void initAnimation(TickerProvider provider) {
    questAboutController.initAnimation(provider);
    questMenuController.initAnimation(provider);
    shopAboutController.initAnimation(provider);
  }

  /// 맵뷰를 초기화합니다.
  @override
  void initMap(
      final GoogleMapController controller,
      void Function(Runnable) setState) async {
    super.initMap(controller, setState);
    // 퀘스트, 상점 목록을 불러옵니다.
    tryLoadQuests();
    tryLoadShops();
  }

  /// 퀘스트, 상점 목록 보기를 서로 전환합니다.
  void switchMode() async {
    if (isModeQuests()) showShops();
    else showQuests();
    // 마커를 갱신합니다.
    updateMarkers();
    // 창을 닫습니다.
    closeAll();
  }

}
