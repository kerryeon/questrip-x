import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:questrip/controller/intro/terms.dart';
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
      child: Text(R.string.terms_field_terms,
        style: TextStyle(fontSize: 12.0, color: Colors.black54),
        textAlign: TextAlign.left,
      ),
      height: height,
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    _controller.init(context);
    return Scaffold(
        body: WillPopScope(
            onWillPop: () => dialogExit(context),
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
                    /// 로고
                    Container(
                        margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Center(
                            child: SvgPicture.asset(
                                'plane.xml',
                                fit:BoxFit.contain
                            )
                        )
                    ),

                    /// 이용약관 타이틀
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
                        child: Text(R.string.terms_field_title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize:20.0,
                              color: const Color(0xFF191919),
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto"),
                        )
                    ),

                    /// 이용약관
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

                    /// 동의 체크박스
                    Container(
                        margin: const EdgeInsets.only(top: 15.0, right: 25.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                R.string.terms_button_agree,
                                style: TextStyle(
                                    fontSize:12.0,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "Roboto"),
                              ),
                              Checkbox(
                                  key: null,
                                  onChanged: (_) => _controller.onConfirmTerms(),
                                  value: false
                              ),
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
