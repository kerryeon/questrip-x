import 'package:flutter/material.dart';
import 'package:questrip/controller/quest/quest_menu.dart';
import 'package:questrip/res/lib.dart';


class QuestMenuState extends State<QuestMenuWidget> {

  final QuestMenuController _controller;

  QuestMenuState(this._controller);

  @override
  Widget build(BuildContext context) {
    _controller.init(context, setState: setState);
    return Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomRight: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // 사용자 닉네임
            Container(
              padding: const EdgeInsets.only(top: 100.0, left: 15.0, right: 15.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    topRight: const Radius.circular(40.0)
                ),
              ),
              width: 200,
              child: Text(
                R.account.nickname,
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            // 사용자 집주소
            Container(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0,
                  left: 15.0, right: 15.0,
              ),
              width: 200,
              color: Colors.amber,
              child: Text(
                R.account.address,
                style: TextStyle(fontSize: 15.0),
              ),
            ),
            // 내가 도전한 퀘스트
            Container(
              padding: const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
              child: RaisedButton(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.local_airport),
                    Text(R.string.about_field_title)
                  ],
                ),
                onPressed: _controller.showAbout,
                color: Colors.amberAccent,
              ),
            ),
            // 환경설정
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: RaisedButton(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.settings),
                    Text(R.string.config_field_title)
                  ],
                ),
                onPressed: _controller.showSetting,
                color: Colors.amberAccent,
              ),
            ),
          ],
        ),
    );
  }
}

class QuestMenuWidget extends StatefulWidget {

  final QuestMenuController _controller;

  QuestMenuWidget(this._controller);

  @override
  State<QuestMenuWidget> createState() => QuestMenuState(_controller);

}
