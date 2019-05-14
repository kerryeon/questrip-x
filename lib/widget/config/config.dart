import 'package:flutter/material.dart';
import 'package:questrip/controller/config/config.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/components.dart';

class ConfigWidget extends StatelessWidget {

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
                            R.string.config_field_title,
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
                          child: Text(R.string.config_button_logout),
                        ),
                      ),

                      ButtonTheme(
                        minWidth: 300.0,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () => _controller.signOff(),
                          child: Text(R.string.config_button_sign_off),
                        ),
                      ),

                      ButtonTheme(
                        minWidth: 300.0,
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () => _controller.showOpenSource(),
                          child: Text(R.string.config_button_open_source),
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