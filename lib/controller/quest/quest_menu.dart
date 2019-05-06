import 'package:flutter/material.dart';
import 'package:questrip/controller/lib.dart';
import 'package:questrip/res/lib.dart';

/// 메인화면의 메뉴창을 제어합니다.
///
/// 담당자: 김호
///
class QuestMenuController extends IController {

  bool visible = false;

  /// 내 퀘스트 목록을 엽니다.
  void showAbout() => Navigator.pushNamed(context, R.widget.aboutView);

  /// 환경설정을 엽니다.
  void showSetting() => Navigator.pushNamed(context, R.widget.config);

  /// 메뉴창을 엽니다.
  void show() => visible = true;

  /// 메뉴창을 닫습니다.
  void hide() => visible = false;

}
