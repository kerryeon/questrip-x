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
                              R.string.sign_up_field_welcome,
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
                                  labelText: R.string.sign_up_field_nickname
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
                                          labelText: R.string.sign_up_field_year
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
                                          labelText: R.string.sign_up_field_month
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
                                          labelText: R.string.sign_up_field_day
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
                                  labelText: R.string.sign_up_field_address
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
                                  labelText: R.string.sign_up_field_address_detail
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
                                  onPressed:_controller.onNext,
                                  elevation: 4.0,
                                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                  child: Text(
                                    R.string.common_alert_button_next,
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
