import 'package:flutter/material.dart';
import 'package:questrip/controller/quest/quest_map.dart';


class Menu extends State<MenuWidget> {

  final QuestMapController _controller = QuestMapController();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                  bottomRight: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0)),
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //이름
              Container(
                padding: const EdgeInsets.only(top: 100, left: 15.0, right: 15),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: new BorderRadius.only(
                        topRight: const Radius.circular(40.0)
                    ),
                ),
                width: 200,
                  child: new Text(
                      "이름",
                      style: TextStyle(fontSize: 25.0),
                    ),
              ),
              //주소
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10,left: 15.0, right: 15),
                width: 200,
                color: Colors.amber,
                child: Text(
                  '주소남도 주소시 주소동 주소아파트 주소호',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              //내 퀘스트
              Container(
                margin: const EdgeInsets.only(top: 10,),
                width: 150,
                child:RaisedButton(
                  child: Row(
                   mainAxisSize: MainAxisSize.min,
                   children: <Widget>[
                    Icon(Icons.local_airport),
                    Text("내 퀘스트")
                   ],
                  ),
                  onPressed: _controller.openMyQuest,
                  color: Colors.amberAccent,
                ),
              ),
              //환경설정
              Container(
                width: 150,
                child:RaisedButton(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.settings),
                      Text("환경설정")
                    ],
                  ),
                  onPressed: _controller.openSettings,
                  color: Colors.amberAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuWidget extends StatefulWidget {
  @override
  State<MenuWidget> createState() => Menu();
}