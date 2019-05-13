import 'package:flutter/material.dart';
import 'package:questrip/controller/leader_board/full_screen.dart';
import 'package:questrip/data/submission.dart';
import 'package:questrip/controller/lib.dart';
import 'package:questrip/lib.dart';
import 'package:questrip/net/client.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'dart:io';

/// 리더보드의 동작을 담당합니다.
///
/// 담당자: 김호
///
abstract class ILeaderBoardController extends IController {

  List<Submission> _submissions;

  SortMode _mode = SortMode.Rating;

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

  /// 추천 기능 사용여부
  bool get isUsableVote;
  /// 신고 기능 사용여부
  bool get isUsableReport;

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

}

/// 정렬 모드를 나열합니다.
enum SortMode {
  Date,     // 최신순
  Rating,   // 추천순
}

/// 리더보드에 사진을 제출하기위해 카메라앱을 호출합니다.
class CameraPicture{
  static void showCamera(BuildContext context) async{
    File picture = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    if(picture != null){
      ImageGallerySaver.save(picture.readAsBytesSync());
      showAlertDialog(context, picture);
    }
  }
}

/// 리더보드에 사진을 제출하기위해 앨범으로 접근합니다.
class GallerySelect{
  static void showGallery(BuildContext context) async{
    File gallery = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if(gallery != null){
      showAlertDialog(context, gallery);
    }
  }
}