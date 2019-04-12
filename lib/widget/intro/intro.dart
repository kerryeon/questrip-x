import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:questrip/net/lib.dart';
import 'package:questrip/net/login/lib.dart';

/// 인트로 화면을 담당하는 클래스입니다.
/// 로고를 약 1초간 보여준 후, 로그인을 시도합니다.
///
/// 담당자: 김호, 이동욱
///
class IntroWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    _login();
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Container(
            margin: const EdgeInsets.only(left: 100.0, right: 100.0),
            child: Center(
                child: SvgPicture.asset(
                  'res/drawable/logo.svg',
                )
            )
        )
    );
  }

  /// 로그인을 시도합니다.
  void _login() {
    tryLogin(_onSuccess, _onFailed, _onNewUser);
  }

  /// 로그인에 성공한 경우의 이벤트입니다.
  /// 메인화면으로 이동합니다.
  void _onSuccess() {
    // TODO to be implemented.
    print('logged in!');
  }

  /// 로그인에 실패한 경우의 이벤트입니다.
  /// 이유를 알려주고 앱을 종료합니다.
  void _onFailed(Failed failed) {
    // TODO to be implemented.
    print('failed!');
    switch (failed) {
      case Failed.NETWORK_FAILURE:
        break;
      case Failed.USER_CANCELED:
        break;
      default:
        break;
    }
  }

  /// 로그인한 사용자가 등록되지 않은 회원인 경우의 이벤트입니다.
  /// 회원가입 화면으로 이동합니다.
  void _onNewUser() {
    // TODO to be implemented.
    print('newbie!');
  }

}
