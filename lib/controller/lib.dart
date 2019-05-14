import 'package:flutter/material.dart';
import 'package:questrip/lib.dart';

/// 각 화면의 동작을 추상화합니다.
///
/// 담당자: 김호
///
abstract class IController {

  BuildContext _context;
  void Function(Runnable) _setState;

  bool _btnLocked;

  /// 객체를 초기화합니다.
  void init(BuildContext context, {void Function(Runnable) setState}) async {
    this._context = context;
    this._setState = setState;
  }

  @protected
  BuildContext get context => _context;

  @protected
  void Function(Runnable) get setState => _setState;

  /// 터치 입력을 받지 않습니다.
  @protected
  bool btnLock() => _btnLocked ?? () {
    _btnLocked = true;
    return false;
  }();

  /// 터치 입력을 받습니다.
  @protected
  void btnUnlock() => _btnLocked = false;

}
