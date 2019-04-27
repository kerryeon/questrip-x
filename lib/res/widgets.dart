import 'package:flutter/material.dart';
import 'package:questrip/res/common.dart';
import 'package:questrip/widget/config/config.dart';
import 'package:questrip/widget/config/open_source.dart';
import 'package:questrip/widget/intro/intro.dart';
import 'package:questrip/widget/intro/sign_up.dart';
import 'package:questrip/widget/intro/terms.dart';
import 'package:questrip/widget/quest/quest_map.dart';

/// 위젯 리소스를 관리합니다.
///
/// 담당자: 이동욱, 구본근, 김호
///
class Widgets extends Resource {

  String get intro => '/intro/intro';
  String get signUp => '/intro/sign/up';
  String get terms => '/intro/terms';

  String get questMap => '/map';

  String get config => '/config';
  String get openSource => '/config/terms';

}

Map<String, WidgetBuilder> makeRoutes(final Widgets w) => {
  w.intro: (BuildContext context) => IntroWidget(),
  w.signUp: (BuildContext context) => SignUpWidget(),
  w.terms: (BuildContext context) => TermsWidget(),
  w.questMap: (BuildContext context) => QuestMapWidget(),
  w.config: (BuildContext context) => ConfigWidget(),
  w.openSource: (BuildContext context) => OpenSourceWidget(),
};
