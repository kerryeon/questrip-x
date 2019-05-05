import 'package:flutter/material.dart';
import 'package:questrip/controller/quest/quest_map.dart';
import 'package:questrip/res/lib.dart';

Container defaultText(text, { margin, final fontSize = 25.0 }) =>
    Container(
      margin: margin ?? const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize),
          textAlign: TextAlign.center,
        ),
      ),
    );

class QuestView extends State<QuestViewWidget> {

  final QuestMapController _controller = QuestMapController();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: new BorderRadius.only(
                  topRight: const Radius.circular(40.0),
                  topLeft: const Radius.circular(40.0))
            ),
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ///타이틀
                defaultText(
                    '감자 먹기 대회',
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    fontSize: 35.0),
                ///내용
                defaultText(
                    '최대한 많은 감자를 먹으세요!',
                    fontSize: 25.0),
                ///위치
                defaultText(
                    '서울특별시',
                    fontSize: 20.0),
                ///기간
                defaultText(
                    '기간',
                    fontSize: 20.0),
                ///리더보드 버튼
                Container(
                    margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    child: RaisedButton(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        R.string.view_field_title,
                        style: TextStyle(fontSize: 25.0),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: _controller.openLeaderBoard,
                      color: Colors.amberAccent,
                    )),
              ]
            ),
          ),
        ),
      ),
    );
  }
}
class QuestViewWidget extends StatefulWidget {
  @override
  State<QuestViewWidget> createState() => QuestView();
}
