import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:questrip/controller/intro/intro_controller.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/bootstrap.dart';

/// 인트로 화면을 담당하는 클래스입니다.
/// 로고를 약 1초간 보여준 후, 로그인을 시도합니다.
///
/// 담당자: 김호, 이동욱
///
class IntroWidget extends Bootstrapper {

  final IntroController _controller = IntroController();

  @override
  Widget buildWidget(BuildContext context) {
    _controller.init(context);
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

}
