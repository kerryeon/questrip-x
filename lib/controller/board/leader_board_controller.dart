import 'package:flutter/material.dart';
import 'package:questrip/data/submission.dart';
import 'package:questrip/controller/lib.dart';
import 'package:questrip/net/client.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

/// 리더보드의 동작을 담당합니다.
///
/// 담당자: 김호
///
class ILeaderBoardController extends IController {

  List<Submission> _submissions;

  /// 리더보드 항목 목록입니다.
  /// TODO to be implemented.
  final Set<Object> items = <Object>{};

  /// 객체를 초기화합니다.
  @override
  void init(BuildContext context) async {
    super.init(context);
    _downloadSubmissions();
  }

  /// 선택한 정렬 조건에 맞추어 리더보드를 정렬합니다.
  /// 반드시 [setState] 메소드 내에서 호출해야 합니다!
  void sortWith(final SortMode mode) async {
    int Function(Submission, Submission) f;
    switch (mode) {
      case SortMode.Date:
        f = Submission.compareDate;
        break;
      case SortMode.Rating:
        f = Submission.compareRating;
        break;
    }
    _submissions.sort(f);
  }

  /// 제출물 목록을 다운로드합니다.
  void _downloadSubmissions() async =>
      request(R.uri.meBoard, _onDownloaded, (f) => dialogFailed(context, f));

  /// 서버로부터 제출물 목록을 성공적으로 다운로드한 경우의 이벤트입니다.
  /// 제출물을 추천순으로 정렬하여 사용자에게 보여줍니다.
  void _onDownloaded(final Map<String, Object> response) async {
    final List<Object> list = response['list'];
    _submissions = list.map((o) => Submission.fromJSON(o));
    sortWith(SortMode.Rating);
  }

}

/// 정렬 모드를 나열합니다.
enum SortMode {
  Date,     // 최신순
  Rating,   // 추천순
}
