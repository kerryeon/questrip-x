import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OpenSource extends StatelessWidget {

  Widget termsText({double width, double height}) {
    return Container(
      child: Text("오픈소스 약관\n 앱에 사용된 여러 오픈소스들 (Google Maps 등..)의 라이선스를 명시하는 부분입니다",
        style: TextStyle(fontSize: 12.0, color: Colors.black54),
        textAlign: TextAlign.left,
      ),
      height: height,
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
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
                        child: Text("오픈소스 약관",
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
                  ],
                )
            )
        )
    );
  }
}