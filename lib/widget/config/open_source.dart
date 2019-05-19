import 'package:flutter/material.dart';
import 'package:questrip/res/lib.dart';

class OpenSourceWidget extends StatelessWidget {

  Widget termsText({double width, double height}) {
    return Container(
      child: SingleChildScrollView(
          child: Text(R.string.open_source_terms,
            style: TextStyle(fontSize: 20.0, color: Colors.black54),
            textAlign: TextAlign.left,
          )
      ),
      height: height,
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(R.string.config_button_open_source)
        ),
        body:Center(
            child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: termsText(width: 400, height: 400),
                      ),
                    ),
                  ],
                )
            )
        )
    );
  }
}