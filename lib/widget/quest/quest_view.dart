import 'package:flutter/material.dart';
import 'package:questrip/controller/quest/quest_view.dart';
import 'package:questrip/res/lib.dart';

/// 해당 화면에서 사용하는 글자 템플릿입니다.
Container defaultText(text, { margin, controller, final fontSize = 20.0, textAlign}) =>
    Container(
      margin: margin ?? const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize),
          textAlign: textAlign,
          // controller: controller,
        ),
      ),
    );

/// 구분 선
class VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 1.0,
      width: 1.0,
      color: Colors.black54,
      margin: const EdgeInsets.only(left: 24.0, right: 24.0),
    );
  }
}

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
              topRight: const Radius.circular(32.0),
              topLeft: const Radius.circular(32.0))
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /// 타이틀
            defaultText(
                _controller.cTitle,
                margin: const EdgeInsets.only(top: 24, bottom: 8),
                fontSize: 24.0,
                textAlign: TextAlign.center
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                /// 위치
                defaultText(
                    _controller.cLocation,
                    margin: const EdgeInsets.only(bottom: 8, right:24),
                    fontSize: 14.0,
                    textAlign: TextAlign.right
                ),
                /// 기간
                defaultText(
                  _controller.cDateEnd,
                  margin: const EdgeInsets.only(bottom: 8),
                    fontSize: 14.0,
                    textAlign: TextAlign.right
                ),
              ],
            ),
            VerticalDivider(),
            /// 내용
            Container(
              margin: const EdgeInsets.only(top:8, left: 24, right: 24, bottom: 16),
              /* decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(16.0))
              ),*/
              child: defaultText(
                  _controller.cDescription,
                  fontSize: 16.0,
                  textAlign: TextAlign.center

              ),
            ),
            /// 리더보드 버튼
            Container(
                margin: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
                child: RaisedButton(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.0)),
                  onPressed: _controller.showLeaderBoard,
                  color: const Color(0xFFFFFFFF),
                  child: Icon(
                      Icons.insert_chart,
                      size:40.0,
                    color:Colors.black87,
                  ),
                  /*Text(
                    R.string.view_field_title,
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),*/
                )
            ),
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
