import 'package:flutter/material.dart';
import 'package:questrip/controller/quest/quest_map/interface.dart';
import 'package:questrip/data/quest.dart';
import 'package:questrip/net/client.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

mixin IQuestMapQuestsController on IQuestMapController {

  /// 퀘스트 목록입니다.
  List<Quest> quests;

  /// 퀘스트 목록을 불러옵니다.
  /// 만약 실패하면, 그 이유를 알려줍니다.
  @protected
  void tryLoadQuests() async => request(
      R.uri.meQuest, _onLoad,
          (e) => dialogFailed(context, e)
  );

  /// 퀘스트 목록을 성공적으로 불러온 경우의 이벤트입니다.
  void _onLoad(final Map<String, Object> response) async {
    final List<Object> raw = response['list'];
    quests = raw.map((q) => Quest.fromJSON(q)).toList();
    quests.sort(Quest.compareRating);
    // 퀘스트 목록을 화면에 뿌리도록 합니다.
    showQuests();
    updateMarkers();
  }

  /// 퀘스트 목록 보기 모드면 true 를 반환합니다.
  bool get isModeQuests => markersData == quests || markersData == null;

  /// 퀘스트 목록 보기 모드로 전환합니다.
  @protected
  void showQuests() => markersData = quests;

}
