import 'package:flutter/services.dart';

/// 자주 사용하는 타입 등을 여기에 정리합니다.
///
/// 담당자: 김호
///

typedef Runnable = void Function();

/// 앱을 종료합니다.
void exit() => SystemChannels.platform.invokeMethod('SystemNavigator.pop');
