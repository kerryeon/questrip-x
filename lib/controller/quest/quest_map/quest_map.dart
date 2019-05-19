import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:questrip/controller/quest/quest_map/interface.dart';
import 'package:questrip/controller/quest/quest_map/quest.dart';
import 'package:questrip/controller/quest/quest_map/shop.dart';
import 'package:questrip/lib.dart';

class QuestMapController extends IQuestMapController
    with IQuestMapQuestsController, IQuestMapShopsController {

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

}
