import 'package:flutter/material.dart';
import 'package:questrip/controller/about/about_view.dart';
import 'package:questrip/controller/lib.dart';
import 'package:questrip/data/quest.dart';
import 'package:questrip/res/lib.dart';

/// 퀘스트 리더보드 화면의 동작을 담당합니다.
///
/// 담당자: 김호, 이동욱
///
class QuestViewController extends IController {

  String cTitle = "";
  String cDescription = "";
  String cLocation = "";
  String cDateEnd = "";

  Quest _quest;

  /// 레이아웃을 보여줍니다.
  void show(final Quest quest) async {
    print('hello world');
    print(setState);
    _quest = quest;
    _update();
  }

  /// 레이아웃을 숨깁니다.
  void hide() async {
    // TODO to be implemented
  }

  /// 리더보드를 보여줍니다.
  void showLeaderBoard() {
    AboutViewController.initQuest(_quest);
    Navigator.pushNamed(context, R.widget.aboutView);
  }

  /// 주어진 정보를 토대로 화면을 갱신합니다.
  void _update() => setState(() {
    cTitle = _quest.title;
    cDescription = _quest.description;
    cLocation = _quest.location;
    cTitle = _quest.title;
  });

}
