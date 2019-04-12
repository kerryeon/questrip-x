import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

BuildContext _context;

/// 인트로 화면을 담당하는 클래스입니다.
/// 로고를 약 1초간 보여준 후, 로그인을 시도합니다.
///
/// 담당자: 김호, 이동욱
///
class QuestMapWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
        body: WillPopScope(
            onWillPop: () => dialogExit(context),
            // TODO to be implemented.
            child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Container(
                    margin: const EdgeInsets.only(left: 120.0, right: 120.0),
                    child: Center(
                        child: SvgPicture.asset(R.drawable.bug,
                        )
                    )
                )
            ))
    );
  }

}
