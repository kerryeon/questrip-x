import 'package:flutter/material.dart';
import 'package:questrip/res/common.dart';
import 'package:questrip/widget/intro/intro.dart';
import 'package:questrip/widget/intro/sign_up.dart';
import 'package:questrip/widget/quest/quest_map.dart';

/// 위젯 리소스를 관리합니다.
///
/// 담당자: 이동욱, 구본근, 김호
///
class Widgets extends Resource {

  String get intro => '/intro/intro';
  String get signUp => '/intro/sign/up';

  String get questMap => '/map';

}

Map<String, WidgetBuilder> makeRoutes(final Widgets w) => {
  w.intro: (BuildContext context) => IntroWidget(),
  w.signUp: (BuildContext context) => SignUpWidget(),
  w.questMap: (BuildContext context) => QuestMapWidget(),
};
