import 'package:flutter/material.dart';
import 'package:questrip/controller/anim/slide.dart';
import 'package:questrip/controller/board/leader_board.dart';
import 'package:questrip/controller/lib.dart';
import 'package:questrip/data/quest.dart';
import 'package:questrip/res/lib.dart';

/// 퀘스트 리더보드 화면의 동작을 담당합니다.
///
/// 담당자: 김호, 이동욱
///
class QuestAboutController extends IController with SlideAnimation {

  String cTitle = "";
  String cDescription = "";
  String cLocation = "";
  String cDateEnd = "";

  Quest _quest;

  /// 레이아웃을 보여줍니다.
  void showAbout(final Quest quest) {
    _quest = quest;
    _update();
    show();
  }

  /// 리더보드를 보여줍니다.
  void showLeaderBoard() {
    ILeaderBoardController.quest = _quest;
    Navigator.pushNamed(context, R.widget.questView);
  }

  /// 주어진 정보를 토대로 화면을 갱신합니다.
  void _update() {
    cTitle = _quest.title;
    cDescription = _quest.description;
    cLocation = _quest.location;
    cTitle = _quest.title;
  }

  @override
  Offset get defaultOffset => SliderAnimationOffset.bottomLayout;

}
