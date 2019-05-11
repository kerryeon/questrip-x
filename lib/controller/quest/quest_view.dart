import 'package:questrip/controller/board/leader_board.dart';
import 'package:questrip/data/quest.dart';
import 'package:questrip/net/client.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

/// 퀘스트 제출물 목록 화면의 동작을 담당합니다.
///
/// 담당자: 김호
///
class QuestViewController extends ILeaderBoardController {

  /// 추천 기능 사용여부
  bool get isUsableVote   => true;
  /// 신고 기능 사용여부
  bool get isUsableReport => true;

  /// 조회할 퀘스트 정보
  static Quest quest;

  /// 제출물 목록을 다운로드합니다.
  @override
  void tryDownloadSubmissions() async =>
      request(
          R.uri.meView, onLoadSubmissions,
              (e) => dialogFailed(context, e),
          data: {'quest_id': quest.id},
      );

}
