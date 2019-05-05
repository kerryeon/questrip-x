import 'package:flutter/material.dart';
import 'package:questrip/controller/lib.dart';
import 'package:questrip/res/lib.dart';

/// 메인화면의 메뉴창을 제어합니다.
///
/// 담당자: 김호
///
class QuestMenuController extends IController {

  /// 내 퀘스트 목록을 엽니다.
  void showAbout() { /* TODO to be implemented */ }

  /// 환경설정을 엽니다.
  void showSetting() => Navigator.pushNamed(context, R.widget.config);

  /// 메뉴창을 엽니다.
  void show() async {
    // TODO to be implemented
  }

  /// 메뉴창을 닫습니다.
  void hide() async {
    // TODO to be implemented
  }

}
