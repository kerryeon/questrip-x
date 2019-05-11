import 'package:questrip/controller/board/leader_board.dart';
import 'package:questrip/net/client.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

/// 내 퀘스트 목록 화면의 동작을 담당합니다.
///
/// 담당자: 김호, 이동욱
///
class AboutViewController extends ILeaderBoardController {

  /// 추천 기능 사용여부
  bool get isUsableVote   => false;
  /// 신고 기능 사용여부
  bool get isUsableReport => false;

  /// 제출물 목록을 다운로드합니다.
  @override
  void tryDownloadSubmissions() async =>
      request(
          R.uri.meBoard, onLoadSubmissions,
              (e) => dialogFailed(context, e)
      );

}
