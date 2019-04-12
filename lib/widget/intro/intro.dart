import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:questrip/lib.dart';
import 'package:questrip/net/lib.dart';
import 'package:questrip/net/login/lib.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';
import 'package:questrip/widget/common/bootstrap.dart';

BuildContext _context;

/// 인트로 화면을 담당하는 클래스입니다.
/// 로고를 약 1초간 보여준 후, 로그인을 시도합니다.
///
/// 담당자: 김호, 이동욱
///
class IntroWidget extends Bootstrapper {

  @override
  Widget buildWidget(BuildContext context) {
    _context = context;
    _login();
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Container(
                margin: const EdgeInsets.only(left: 100.0, right: 100.0),
                child: Center(
                    child: SvgPicture.asset(R.drawable.logo,
                    )
                )
            )
        ));
  }

  /// 로그인을 시도합니다.
  void _login() => tryLogin(_onSuccess, _onFailed, _onNewUser);

  /// 로그인에 성공한 경우의 이벤트입니다.
  /// 메인화면으로 이동합니다.
  void _onSuccess() => Navigator.popAndPushNamed(_context, R.widget.questMap);

  /// 로그인에 실패한 경우의 이벤트입니다.
  /// 이유를 알려주고 앱을 종료합니다.
  void _onFailed(Failed failed) => dialogFailed(_context, failed, onConfirm: exit);

  /// 로그인한 사용자가 등록되지 않은 회원인 경우의 이벤트입니다.
  /// 회원가입 화면으로 이동합니다.
  void _onNewUser() => Navigator.popAndPushNamed(_context, R.widget.signUp);

}
