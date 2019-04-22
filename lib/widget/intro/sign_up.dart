import 'package:flutter/material.dart';
import 'package:questrip/controller/intro/sign_up.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';
import 'package:questrip/widget/common/components.dart';

class SignUpWidget extends StatefulWidget {
  State createState() => _SignUpState();
}

/// 인트로 화면을 담당하는 클래스입니다.
/// 로고를 약 1초간 보여준 후, 로그인을 시도합니다.
///
/// 담당자: 이동욱, 구본근
///
class _SignUpState extends State<SignUpWidget> {

  final SignUpController _controller = SignUpController();

  @override
  Widget build(BuildContext context) {
    _controller.init(context, setState: setState);
    return Scaffold(
        body: WillPopScope(
            onWillPop: () => dialogExit(context),
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
                              style: defaultTextStyle(
                                fontSize: 30,
                                color: 0xffffc107
                              ),
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(bottom: 40.0),
                            child: TextField(
                              controller: _controller.cNickname,
                              decoration: InputDecoration(
                                  labelText: R.string.sign_up_field_nickname,
                              ),
                              maxLength: 12,
                              style: defaultTextStyle(),
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(bottom: 40.0),
                            child: Row(
                                children: <Widget>[
                                  Flexible(
                                    child: textFieldButton(context,
                                      controller: _controller.cYear,
                                      labelText: R.string.sign_up_field_year,
                                      onTap: _controller.getBirthday,
                                    ),
                                  ),
                                  Flexible(
                                    child: textFieldButton(context,
                                      controller: _controller.cMonth,
                                      labelText: R.string.sign_up_field_month,
                                      onTap: _controller.getBirthday,
                                    ),
                                  ),
                                  Flexible(
                                    child: textFieldButton(context,
                                      controller: _controller.cDay,
                                      labelText: R.string.sign_up_field_day,
                                      onTap: _controller.getBirthday,
                                    ),
                                  ),
                                ]
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(bottom: 40.0),
                            child: textFieldButton(context,
                              controller: _controller.cAddress,
                              labelText: R.string.sign_up_field_address,
                              onTap: _controller.getAddress,
                            ),
                          ),

                          Container(
                            margin: const EdgeInsets.only(bottom: 50.0),
                            child: TextField(
                              controller: _controller.cAddressDetail,
                              decoration: InputDecoration(
                                  labelText: R.string.sign_up_field_address_detail
                              ),
                              maxLength: 64,
                              style: defaultTextStyle(),
                            ),
                          ),

                          ButtonTheme(
                              minWidth: 200.0,
                              height: 40.0,
                              child: RaisedButton(
                                  key: null,
                                  onPressed: _controller.onNext,
                                  elevation: 4.0,
                                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                  child: Text(
                                    R.string.common_alert_button_next,
                                    style: defaultTextStyle(
                                      fontSize: 20,
                                    ),
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
