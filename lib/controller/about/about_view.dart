import 'package:questrip/controller/board/leader_board.dart';
import 'package:questrip/data/quest.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

/// 내 퀘스트 목록 화면의 동작을 담당합니다.
///
/// 담당자: 김호, 이동욱
///
class AboutViewController extends ILeaderBoardController {

  static Quest _quest;

  /// 표시할 퀘스트 정보를 가져옵니다.
  static void initQuest(final Quest quest) {
    _quest = quest;
  }

  /// 정렬 모드를 바꿉니다.
  void changeSortMode(final SortMode mode) {
    // TODO to be implemented.
    toast(R.string.debug_todo);
  }

}
