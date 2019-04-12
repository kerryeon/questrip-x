import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:questrip/widget/intro/intro.dart';

/// 앱을 구동합니다.
/// 
/// 담당자: 김호
///
void main() => runApp(
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
));
