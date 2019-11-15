import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:questrip/controller/leader_board/full_screen.dart';
import 'package:questrip/data/quest.dart';
import 'package:questrip/data/submission.dart';
import 'package:questrip/controller/lib.dart';
import 'package:questrip/net/client.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/board/leader_board.dart';
import 'package:questrip/widget/common/alert.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:tuple/tuple.dart';

/// 리더보드의 동작을 담당합니다.
///
/// 담당자: 김호
///
abstract class ILeaderBoardController extends IController {

  List<Submission> _submissions;

  SortMode _mode = SortMode.Rating;

  /// 조회할 퀘스트 정보
  static Quest quest;

  /// 이미지를 전체화면으로 보여줍니다.
  void showFullscreen(final Submission submission) {
    FullScreenController.submission = submission;
    Navigator.pushNamed(context, R.widget.boardFullScreen);
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

  /// 정렬 모드를 바꾸고, 화면을 갱신합니다.
  void changeSortMode(final SortMode mode) {
    _mode = mode;
    _update();
  }

  /// 퀘스트 제출물 목록을 반환합니다.
  /// 만약 없다면, 다운로드합니다.
  List<Submission> get submissions {
    if (_submissions != null) return _submissions;
    // 다운로드합니다.
    tryDownloadSubmissions();
    return _submissions ?? [];
  }

  bool get isModeDate   => _mode == SortMode.Date;
  bool get isModeRating => _mode == SortMode.Rating;

  /// 제출 기능 사용여부
  bool get isUsableSubmit;

  /// 제출물 목록을 다운로드합니다.
  @protected
  void tryDownloadSubmissions();

  /// 퀘스트 제출물 목록을 성공적으로 불러온 경우의 이벤트입니다.
  @protected
  void onLoadSubmissions(final Map<String, Object> response) async {
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

  /// 도전하기 버튼을 터치한 경우의 이벤트입니다.
  /// 사진을 촬영하거나, 앨범에서 사진을 가져옵니다.
  void onClickedSubmit() =>
      dialogCase(context, R.string.view_button_submit, cases: [
        Tuple2(R.string.leader_board_upload_camera, _submitViaCamera),
        Tuple2(R.string.leader_board_upload_gallery, _submitViaGallery),
      ]);

  /// 추천 버튼을 터치한 경우의 이벤트입니다.
  /// 서버에 제출물 추천 요청을 합니다.
  void onClickedVote(final Submission submission) async => dialog(
    context, R.string.view_alert_vote(submission.nickname),
    onConfirm: () => _tryVote(submission),
    onCancel: () => {},
  );

  /// 신고 버튼을 터치한 경우의 이벤트입니다.
  /// 사용자에게 신고 사유를 선택케 하는 알림창을 띄웁니다.
  /// 서버에 제출물 신고 요청을 합니다.
  void onClickedReport(final Submission submission) async => dialogCase(
      context, R.string.view_field_report, cases: [
    Tuple2(0, R.string.leader_board_report_violent),
    Tuple2(1, R.string.leader_board_report_ads),
    Tuple2(2, R.string.leader_board_report_papering),
    Tuple2(3, R.string.leader_board_report_irrelevant),
    Tuple2(4, R.string.leader_board_report_etc),
  ].map(
          (final t) => Tuple2(t.item2,
              () => _tryReport(submission, t.item1)
      )
  ).toList());

  /// 서버에 사진을 제출합니다.
  void trySubmit(final List<File> images) async => requestAccept(
    R.uri.meSubmit,
        () {
          dialog(context, R.string.view_alert_submitted);
          // 제출물 목록을 업데이트합니다.
          _refresh();
        },
        (f) => dialogFailed(context, f),
    data: {
      "quest_id": quest.id,
      "image": images
          .map((image) async => Base64Codec().encode(await image.readAsBytes()))
          .toList(),
    },
  );

  /// 서버에 제출물 추천 요청을 합니다.
  void _tryVote(final Submission submission) async => requestAccept(
    R.uri.meVote,
        () {
          dialog(context, R.string.view_alert_voted);
          // 제출물 목록을 업데이트합니다.
          _refresh();
        },
        (f) => dialogFailed(context, f,
            rejected: R.string.view_alert_vote_duplicate),
    data: {
      "submission_id": submission.id
    },
  );

  /// 서버에 제출물 신고 요청을 합니다.
  void _tryReport(final Submission submission, final int reason) async => requestAccept(
    R.uri.meReport,
        () => dialog(context, R.string.view_alert_reported),
        (f) => dialogFailed(context, f,
            rejected: R.string.view_alert_report_duplicate),
    data: {
      "submission_id": submission.id,
      "reason": reason,
    },
  );

  /// 사진을 촬영합니다.
  void _submitViaCamera() async {
    final File image = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (image != null) {
      ImageGallerySaver.saveImage(image.readAsBytesSync());
      LeaderBoardState.showSubmitConfirmDialog(context, image, this);
    }
  }

  /// 앨범에서 사진을 불러옵니다.
  void _submitViaGallery() async {
    final File image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (image != null)
      LeaderBoardState.showSubmitConfirmDialog(context, image, this);
  }

  /// 제출물 목록을 다시 불러옵니다.
  void _refresh() async {
    _submissions = null;
    setState(() {});
  }

}

/// 정렬 모드를 나열합니다.
enum SortMode {
  Date,     // 최신순
  Rating,   // 추천순
}
