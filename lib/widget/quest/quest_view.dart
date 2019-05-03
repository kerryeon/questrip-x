import 'package:flutter/material.dart';
import 'package:questrip/controller/quest/quest_map.dart';

class QusetView extends State<QuestViewWidget> {

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
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    '퀘스트 제목',
                    style: TextStyle(fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                ///내용
                SingleChildScrollView(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 130,
                        margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                        padding: const EdgeInsets.all(5),
                        color: Colors.amber[100],
                        child: SingleChildScrollView(
                          child: Container(
                            width: 400,
                            child: Text(
                              'desc',
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ///위치
                Container(
                  child: Text(
                    '경상남도 진주시 가좌동',
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                ///기간
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    '기간',
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                ///리더보드 버튼
                RaisedButton(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    '리 더 보 드',
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: _controller.openLeaderBoard,
                  color: Colors.amberAccent,
                ),
                ///상점
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.shopping_cart),
                      Text("상점", style: TextStyle(fontSize: 20.0),)

                    ],
                  ),
                ),
                ///상점 목록
                SingleChildScrollView(
                  child: Stack(
                      children: <Widget>[
                        Container(
                          //width:300,
                          height: 210,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children: <Widget>[
                                  Container(//상점메뉴
                                    margin: const EdgeInsets.only(
                                      left: 10, bottom: 10,
                                    ),
                                    padding: const EdgeInsets.only(
                                      left: 10, right: 10,
                                    ),
                                    decoration: new BoxDecoration(
                                      color: Colors.amber[100],
                                      borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    height: 200,
                                    width: 150,
                                    child: Column(
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: new Text(
                                                  "상점메뉴1"
                                              )
                                          ),
                                          Container(
                                            decoration: new BoxDecoration(
                                              border: Border.all(color: Colors.black),
                                            ),
                                            height: 150,
                                            width: 130,
                                            child: Text("이미지자리"),
                                          ),
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: new Text(
                                                  "0000원"
                                              )
                                          ),
                                        ]
                                    ),
                                  ),
                                  Container(//상점메뉴
                                    margin: const EdgeInsets.only(
                                      left: 10, bottom: 10,
                                    ),
                                    padding: const EdgeInsets.only(
                                      left: 10, right: 10,
                                    ),
                                    decoration: new BoxDecoration(
                                      color: Colors.amber[100],
                                      borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    height: 200,
                                    width: 150,
                                    child: Column(
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: new Text(
                                                  "상점메뉴2"
                                              )
                                          ),
                                          Container(
                                            decoration: new BoxDecoration(
                                              border: Border.all(color: Colors.black),
                                            ),
                                            height: 150,
                                            width: 130,
                                            child: Text(""),
                                          ),
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: new Text(
                                                  "0000원"
                                              )
                                          ),
                                        ]
                                    ),
                                  ),
                                  Container(//상점메뉴
                                    margin: const EdgeInsets.only(
                                      left: 10, bottom: 10,
                                    ),
                                    padding: const EdgeInsets.only(
                                      left: 10, right: 10,
                                    ),
                                    decoration: new BoxDecoration(
                                      color: Colors.amber[100],
                                      borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    height: 200,
                                    width: 150,
                                    child: Column(
                                        children: <Widget>[
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: new Text(
                                                  "상점메뉴3"
                                              )
                                          ),
                                          Container(
                                            decoration: new BoxDecoration(
                                              border: Border.all(color: Colors.black),
                                            ),
                                            height: 150,
                                            width: 130,
                                            child: Text(""),
                                          ),
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: new Text(
                                                  "0000원"
                                              )
                                          ),
                                        ]
                                    ),
                                  ),
                                ]
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
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
  State<QuestViewWidget> createState() => QusetView();
}
