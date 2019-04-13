import 'package:flutter/material.dart';

/// 각 화면의 동작을 추상화합니다.
///
/// 담당자: 김호
///
class Manager {

  BuildContext _context;

  /// 객체를 초기화합니다.
  void init(BuildContext context) async {
    this._context = context;
  }

  @protected
  BuildContext get context => _context;

}
