import 'package:flutter/material.dart';
import 'package:questrip/controller/about/about_view.dart';
import 'package:questrip/controller/board/leader_board.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

/// 퀘스트 목록을 담당하는 클래스입니다.
///
///
///
///
class AboutViewWidget extends StatefulWidget {
  State createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutViewWidget> {

  final AboutViewController _controller = AboutViewController();

  Widget questContents() {
    /// 퀘스트 컨텐츠
    return Card(
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          /// 퀘스트 제목
          Padding(
            padding: const EdgeInsets.only(top:16.0, left:16.0, right: 16.0),
            child: Text("첨성대 앞에서 멋지게 한 컷!",
                style: TextStyle(
                  fontSize:20.0,
                )
            ),
          ),
          /// 퀘스트 장소
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("경상북도 경주시",
                style: TextStyle(
                  fontSize:12.0,
                )
            ),
          ),
          /// 퀘스트 수행 사진
          Image.asset(
            'res/drawable/sample_image.png',
            fit:BoxFit.contain,
          ),
          /// 좋아요
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                    "Like 2",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize:12.0,
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _controller.init(context);
    return Scaffold(
        body: WillPopScope(
            onWillPop: () => dialogExit(context),
          child: SingleChildScrollView(
            child: Container(
                decoration: BoxDecoration(color: Colors.amber),
                padding: const EdgeInsets.only(top: 80.0),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    /// 타이틀
                    Text(
                      "나의 도전",
                      textAlign : TextAlign.center,
                      style: new TextStyle(fontSize:36.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto"),
                    ),
                    /// 체크박스 (인기 순, 최신 순)
                    Container(
                      margin: const EdgeInsets.only(left: 5.0, right: 5.0, top: 30.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("인기 순"),
                          Checkbox(key:null, onChanged: (_) => _controller.onCheckPopularity(), value: true),
                          Text("최신 순"),
                          Checkbox(key:null, onChanged: (_) => _controller.onCheckNew(), value: true)
                        ],
                      )
                    ),

                    /// 퀘스트
                    Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFfafafa),
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(24.0),
                                topRight: const Radius.circular(24.0)
                            )
                        ),
                        child: Column(
                            children: <Widget>[
                            questContents(),
                            questContents(),
                            questContents(),
                          ]
                        )
                    )
                  ]
              )
            ),
          )

        )
    );
  }
}