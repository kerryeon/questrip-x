import 'package:flutter/material.dart';
import 'package:questrip/controller/config/utils_controller.dart';
import 'package:questrip/widget/common/components.dart';

class ConfigViewWidget extends StatelessWidget {

  final ConfigController _controller = ConfigController();
  @override
  Widget build(BuildContext context) {
    _controller.init(context);
    return Scaffold(
        body:Center(
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
                            "환경설정",
                            textAlign : TextAlign.center,
                            style: defaultTextStyle(
                                fontSize: 30,
                                color: 0xffffc107
                            )
                        ),
                      ),

                      ButtonTheme(
                        minWidth: 300.0,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () => _controller.logout(),
                          child: Text("로그아웃"),
                        ),
                      ),

                      ButtonTheme(
                        minWidth: 300.0,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () => _controller.signOff(),
                          child: Text("회원탈퇴"),
                        ),
                      ),

                      ButtonTheme(
                        minWidth: 300.0,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () => _controller.showOpenSource(),
                          child: Text("오픈소스 약관"),
                        ),
                      )
                    ],
                  ),
                )
            )
        )
    );
  }
}