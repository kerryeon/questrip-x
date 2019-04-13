import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 자주 사용하는 타입 등을 여기에 정리합니다.
///
/// 담당자: 김호
///

typedef Runnable = void Function();

/// 앱을 종료합니다.
void exit() => SystemChannels.platform.invokeMethod('SystemNavigator.pop');

/// 각 화면의 동작을 추상화합니다.
class Manager {

  BuildContext _context;

  /// 객체를 초기화합니다.
  void init(BuildContext context) async {
    this._context = context;
  }

  @protected
  BuildContext get context => _context;

}
