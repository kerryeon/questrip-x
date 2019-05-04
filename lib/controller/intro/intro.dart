import 'package:flutter/material.dart';
import 'package:questrip/lib.dart';
import 'package:questrip/controller/lib.dart';
import 'package:questrip/net/lib.dart';
import 'package:questrip/net/login/lib.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

/// 인트로 화면의 동작을 담당합니다.
///
/// 담당자: 김호, 이동욱
///
class IntroController extends IController {

  /// 객체를 초기화합니다.
  @override
  void init(BuildContext context, {void Function(Runnable) setState}) async {
    super.init(context, setState: setState);
    _requestPermission();
  }

  /// 권한 획득을 시도합니다.
  /// 획득에 성공하면 로그인을 시도합니다.
  void _requestPermission() async =>
      await R.requestPermission()
          ? tryLogin(_onSuccess, _onFailure, _onNewUser)
          : _onPermissionDenied();

  /// 로그인에 성공한 경우의 이벤트입니다.
  /// 메인화면으로 이동합니다.
  void _onSuccess() => Navigator.popAndPushNamed(context, R.widget.aboutView);

  /// 로그인에 실패한 경우의 이벤트입니다.
  /// 이유를 알려주고 앱을 종료합니다.
  void _onFailure(Failed failed) => dialogFailed(context, failed, onConfirm: exit);

  /// 로그인한 사용자가 등록되지 않은 회원인 경우의 이벤트입니다.
  /// 회원가입 화면으로 이동합니다.
  void _onNewUser() => Navigator.popAndPushNamed(context, R.widget.signUp);

  /// 권한 획득에 실패한 경우의 이벤트입니다.
  /// 권한 획득이 필요하다고 알려주고 앱을 종료합니다.
  void _onPermissionDenied() => dialog(context, R.string.permission_denied, onConfirm: exit);

}
