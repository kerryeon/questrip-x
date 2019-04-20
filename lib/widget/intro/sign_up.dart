import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:questrip/controller/intro/sign_up_controller.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

/// 인트로 화면을 담당하는 클래스입니다.
/// 로고를 약 1초간 보여준 후, 로그인을 시도합니다.
///
/// 담당자: 이동욱, 구본근
///
class SignUpWidget extends StatelessWidget {

  final SignUpController _controller = SignUpController();
  void buttonPressedNext() {
    /// 다음 버튼 이벤트입니다.
  }

  @override
  Widget build(BuildContext context) {
    _controller.init(context);
    return Scaffold(
        body: WillPopScope(
            onWillPop: () => dialogExit(context),
            // TODO to be implemented.
            child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Container(
                    margin: const EdgeInsets.only(left: 80.0, right: 80.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                            Container(
                                margin: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                                child: Text(
                                    "Welcome to Questrip!",
                                    textAlign : TextAlign.center,
                                    style: TextStyle(
                                        fontSize:30.0,
                                        color: const Color(0xffffc107),
                                        fontWeight: FontWeight.w300,
                                        fontFamily: "Roboto"),
                                ),
                            ),

                            Container(
                                margin: const EdgeInsets.only(bottom: 40.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: '닉네임'
                                  ),
                                  style: TextStyle(
                                      fontSize:15.0,
                                      height: 1,
                                      color: const Color(0xFF000000),
                                      fontWeight: FontWeight.w200,
                                      fontFamily: "Roboto"),
                                ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(bottom: 40.0),
                              child: Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            labelText: '년'
                                        ),
                                        style: TextStyle(
                                            fontSize:15.0,
                                            color: const Color(0xFF000000),
                                            fontWeight: FontWeight.w200,
                                            fontFamily: "Roboto"),
                                      ),
                                    ),
                                    Flexible(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            labelText: '월'
                                        ),
                                        style: TextStyle(
                                            fontSize:15.0,
                                            color: const Color(0xFF000000),
                                            fontWeight: FontWeight.w200,
                                            fontFamily: "Roboto"),
                                      ),
                                    ),
                                    Flexible(
                                      child: TextField(
                                        decoration: InputDecoration(
                                            labelText: '일'
                                        ),
                                        style: TextStyle(
                                            fontSize:15.0,
                                            color: const Color(0xFF000000),
                                            fontWeight: FontWeight.w200,
                                            fontFamily: "Roboto"),
                                      ),
                                    ),
                                  ]
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(bottom: 40.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    labelText: '주소'
                                ),
                                style: TextStyle(
                                    fontSize:15.0,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "Roboto"),
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.only(bottom: 50.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    labelText: '상세주소'
                                ),
                                style: TextStyle(
                                    fontSize:15.0,
                                    color: const Color(0xFF000000),
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "Roboto"),
                              ),
                            ),

                            ButtonTheme(
                              minWidth: 200.0,
                              height: 40.0,
                              child: RaisedButton(
                                  key:null,
                                  onPressed:buttonPressedNext,
                                  elevation: 4.0,
                                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                  child: Text(
                                    "다음",
                                    style: new TextStyle(
                                        fontSize:20.0,
                                        color: const Color(0xFFFFFFFF),
                                        fontWeight: FontWeight.w200,
                                        fontFamily: "Roboto"),
                                  )
                              )
                            )
                        ]
                    )
                )
            ))
    );
  }
}
