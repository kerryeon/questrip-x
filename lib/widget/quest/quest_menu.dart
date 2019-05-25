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
        width: 256,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              bottomRight: const Radius.circular(16.0),
              topRight: const Radius.circular(16.0)),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // 사용자 닉네임
                Container(
                  padding: const EdgeInsets.only(top: 104.0, left: 24.0, right: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                        topRight: const Radius.circular(16.0)
                    ),
                  ),
                  width: 256,
                  child: Text(
                    R.account.nickname,
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
                // 사용자 집주소
                Container(
                  padding: const EdgeInsets.only(
                    top: 8.0, bottom: 16.0,
                    left: 24.0, right: 16.0,
                  ),
                  width: 256,
                  color: Colors.amber,
                  child: Text(
                    R.account.address,
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                // 내가 도전한 퀘스트
                Container(
                  padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: RaisedButton(
                    elevation: 0.0,
                    highlightElevation: 0.0,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.amberAccent.withOpacity(0.5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Icon(Icons.local_airport),
                        ),
                        Text(R.string.about_field_title)
                      ],
                    ),
                    onPressed: _controller.showAbout,
                    color: Colors.transparent,
                  ),
                ),
                // 환경설정
                Container(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: RaisedButton(
                    elevation: 0.0,
                    highlightElevation: 0.0,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.amberAccent.withOpacity(0.5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Icon(Icons.settings),
                        ),
                        Text(R.string.config_field_title)
                      ],
                    ),
                    onPressed: _controller.showSetting,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
            // 적립금
            Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(Icons.monetization_on),
                  Text(' ${R.account.cSavings}${R.string.shop_unit_money}'),
                ],
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
