import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:questrip/controller/intro/terms_controller.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

/// 인트로 화면을 담당하는 클래스입니다.
/// 로고를 약 1초간 보여준 후, 로그인을 시도합니다.
///
/// 담당자: 이동욱, 구본근
///
class TermsWidget extends StatelessWidget {

  final TermsController _controller = TermsController();

  Widget termsText({double width, double height}) {
    /// 약관동의 내용 위젯입니다.
    return Container(
      child: Text('약관내용\n TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST ',
        style: TextStyle(fontSize: 12.0, color: Colors.black54),
        textAlign: TextAlign.left,
      ),
      height: height,
      width: width,
    );
  }
  void checkAgree(bool value) {
    /// 약관동의 체크 이벤트입니다.
  }

  @override
  Widget build(BuildContext context) {
    _controller.init(context);
    return Scaffold(
        body: WillPopScope(
            onWillPop: () => dialogExit(context),
            // TODO to be implemented.
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0))
                ),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    Container(
                        margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Center(
                            child: SvgPicture.asset(
                              'plane.xml',
                              fit:BoxFit.contain
                            )
                        )
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 100.0, left: 15.0, right: 15.0),
                        alignment: Alignment.center,
                        width: 300.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(15.0),
                                topRight: const Radius.circular(15.0)
                            ),
                            border: Border.all(
                                color: Colors.amber,
                                width: 1
                            )
                        ),
                        child: Text("이용약관",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize:20.0,
                            color: const Color(0xFF191919),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Roboto"),
                        )
                    ),
                    SingleChildScrollView(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                            padding: const EdgeInsets.all(10.0),
                            width: 300.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.amber,
                                width: 1,
                              ),
                              borderRadius: new BorderRadius.only(
                                  bottomLeft: const Radius.circular(15.0),
                                  bottomRight: const Radius.circular(15.0)
                              ),
                            ),
                            child: termsText(width: 400, height: 400),
                          ),
                        ]
                      ),
                    ),

                    Container(
                        margin: const EdgeInsets.only(top: 15.0, right: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "상기 약관에 동의합니다.",
                              style: TextStyle(
                                  fontSize:12.0,
                                  color: const Color(0xFF000000),
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Roboto"),
                            ),
                            Checkbox(key:null, onChanged: checkAgree, value:true),
                          ]
                      )
                    )
                ],
              )
            )
        )
    );
  }
}
