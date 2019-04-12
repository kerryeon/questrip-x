import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/res/widgets.dart';
import 'package:questrip/widget/intro/intro.dart';

/// 앱을 구동합니다.
/// 
/// 담당자: 김호
///
void main() {
  R.init();
  runApp(
      MaterialApp(
        home: IntroWidget(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en'),
          const Locale('ko', 'KR'),
        ],
        routes: makeRoutes(R.widget),
      ));
}
