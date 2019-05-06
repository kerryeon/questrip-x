import 'package:flutter/material.dart';
import 'package:questrip/controller/board/leader_board.dart';
import 'package:questrip/controller/leader_board/full_screen.dart';
import 'package:questrip/data/quest.dart';
import 'package:questrip/data/submission.dart';
import 'package:questrip/net/client.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

/// 내 퀘스트 목록 화면의 동작을 담당합니다.
///
/// 담당자: 김호, 이동욱
///
class AboutViewController extends ILeaderBoardController {

  List<Submission> _submissions;

  SortMode _mode = SortMode.Rating;

  /// 정렬 모드를 바꾸고, 화면을 갱신합니다.
  void changeSortMode(final SortMode mode) {
    _mode = mode;
    _update();
  }

  /// 이미지를 전체화면으로 보여줍니다.
  void showFullscreen(final Submission submission) {
    FullScreenController.submission = submission;
    Navigator.pushNamed(context, R.widget.boardFullScreen);
  }

  /// 퀘스트 제출물 목록을 반환합니다.
  /// 만약 없다면, 다운로드합니다.
  List<Submission> get submissions {
    if (_submissions != null) return _submissions;
    // 다운로드합니다.
    request(
        R.uri.meBoard, _onLoadSubmissions,
            (e) => dialogFailed(context, e)
    );
    return _submissions ?? [];
  }

  bool get isModeDate   => _mode == SortMode.Date;
  bool get isModeRating => _mode == SortMode.Rating;

  /// 퀘스트 제출물 목록을 성공적으로 불러온 경우의 이벤트입니다.
  void _onLoadSubmissions(final Map<String, Object> response) async {
    final List<Object> raw = response['list'];
    _submissions = raw.map((q) => Submission.fromJSON(q)).toList();
    _update();
  }

  /// 화면을 갱신합니다.
  void _update() async => setState(() {
    switch (_mode) {
      case SortMode.Date:
        _submissions.sort(Submission.compareDate);
        break;
      case SortMode.Rating:
        _submissions.sort(Submission.compareRating);
        break;
    }
  });

}
