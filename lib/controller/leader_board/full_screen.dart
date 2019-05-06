import 'package:questrip/controller/lib.dart';
import 'package:questrip/data/submission.dart';

/// 이미지를 전체화면으로 보여줍니다.
///
/// 담당자: 김호
///
class FullScreenController extends IController {

  static Submission submission;

  String get imagePath => submission.imagePath;

}
