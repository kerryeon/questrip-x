import 'package:flutter/material.dart';
import 'package:questrip/controller/quest/quest_view.dart';
import 'package:questrip/res/lib.dart';

/// 해당 화면에서 사용하는 글자 템플릿입니다.
Container defaultText(text, { margin, controller, final fontSize = 20.0, }) =>
    Container(
      margin: margin ?? const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize),
          textAlign: TextAlign.center,
          // controller: controller,
        ),
      ),
    );

/// 메인화면의 퀘스트 정보를 표시합니다.
/// 퀘스트 제목, 설명, 위치, 만료일자를 띄웁니다.
/// 하단에는 리더보드 버튼을 두어, 해당 퀘스트의 리더보드를 조회할 수 있습니다.
///
/// 담당자: 김호, 구본근
///
class _QuestViewState extends State<QuestViewWidget> {

  final QuestViewController _controller;

  _QuestViewState(this._controller);

  @override
  Widget build(BuildContext context) {
    _controller.init(context, setState: setState);
    return Container(
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: const BorderRadius.only(
              topRight: const Radius.circular(40.0),
              topLeft: const Radius.circular(40.0))
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /// 타이틀
            defaultText(
                _controller.cTitle,
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                fontSize: 35.0),
            /// 내용
            defaultText(
                _controller.cDescription,
                fontSize: 25.0),
            /// 위치
            defaultText(_controller.cLocation),
            /// 기간
            defaultText(_controller.cDateEnd),
            /// 리더보드 버튼
            Container(
                margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: RaisedButton(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    R.string.view_field_title,
                    style: TextStyle(fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: _controller.showLeaderBoard,
                  color: Colors.amberAccent,
                )),
          ]
      ),
    );
  }
}

class QuestViewWidget extends StatefulWidget {

  final QuestViewController _controller;

  QuestViewWidget(this._controller);

  @override
  State<QuestViewWidget> createState() => _QuestViewState(_controller);

}
