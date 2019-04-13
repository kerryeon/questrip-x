import 'package:flutter/material.dart';
import 'package:questrip/lib.dart';
import 'package:questrip/net/lib.dart';
import 'package:questrip/net/login/lib.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

/// 인트로 화면의 동작을 담당합니다.
///
/// 담당자: 김호, 이동욱
///
class IntroManager extends Manager {

  /// 객체를 초기화합니다.
  @override
  void init(BuildContext context) async {
    super.init(context);
    _requestPermission();
  }

  /// 권한 획득을 시도합니다.
  /// 로그인을 시도합니다.
  void _requestPermission() async {
    if (await R.requestPermission())
      // 권한 획득에 성공한 경우.
      // 로그인을 시도합니다.
      tryLogin(_onSuccess, _onFailed, _onNewUser);
    else print('Denied!');
  }

  /// 로그인에 성공한 경우의 이벤트입니다.
  /// 메인화면으로 이동합니다.
  void _onSuccess() => Navigator.popAndPushNamed(context, R.widget.questMap);

  /// 로그인에 실패한 경우의 이벤트입니다.
  /// 이유를 알려주고 앱을 종료합니다.
  void _onFailed(Failed failed) => dialogFailed(context, failed, onConfirm: exit);

  /// 로그인한 사용자가 등록되지 않은 회원인 경우의 이벤트입니다.
  /// 회원가입 화면으로 이동합니다.
  void _onNewUser() => Navigator.popAndPushNamed(context, R.widget.signUp);

}
