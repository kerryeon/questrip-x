import 'package:flutter/material.dart';
import 'package:questrip/controller/about/about_view.dart';
import 'package:questrip/controller/board/leader_board.dart';
import 'package:questrip/data/submission.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

/// 퀘스트 목록의 동작을 담당하는 클래스입니다.
/// 퀘스트의 제출물들을 특정한 순서대로 보여줍니다.
/// 추천순, 최신순으로 정렬하여 볼 수 있습니다.
/// 그 외에 퀘스트를 제출하거나, 추천, 신고할 수 있습니다.
///
/// 담당자: 김호
///
class AboutViewWidget extends StatefulWidget {
  State createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutViewWidget> {

  final AboutViewController _controller = AboutViewController();

  /// 퀘스트 제출물을 UI 위젯으로 변환합니다.
  Widget _questContents(final Submission submission) {
    /// 퀘스트 컨텐츠
    return Card(
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              /// 퀘스트 제목
              Align(
                alignment: FractionalOffset.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0, bottom: 16.0,
                      left: 24.0, right: 16.0),
                  child: Text(submission.nickname,
                      style: TextStyle(
                        fontSize: 20.0,
                      )
                  ),
                ),
              ),
              /// 퀘스트 장소
              Align(
                alignment: FractionalOffset.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                      "${submission.year}-${submission.month}-${submission.day}",
                      style: TextStyle(
                        fontSize: 12.0,
                      )
                  ),
                ),
              ),
            ],
          ),
          /// 퀘스트 수행 사진
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                  onTap: () => _controller.showFullscreen(submission),
                  child: Image.network(
                    R.uri.pathImage + submission.imagePath,
                    fit: BoxFit.contain,
                  )
              )
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
                    "Like ${submission.rating}",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12.0,
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
    _controller.init(context, setState: setState);
    return Scaffold(
        body: SingleChildScrollView(
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
                        R.string.about_field_title,
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
                              GestureDetector(
                                  onTap: () => _controller.changeSortMode(SortMode.Rating),
                                  child: Row(
                                    children: <Widget>[
                                      Text(R.string.leader_board_rating),
                                      Checkbox(
                                        key: null,
                                        onChanged: (_) => _controller.changeSortMode(SortMode.Rating),
                                        value: _controller.isModeRating,
                                      )
                                    ],
                                  )
                              ),
                              GestureDetector(
                                  onTap: () => _controller.changeSortMode(SortMode.Date),
                                  child: Row(
                                    children: <Widget>[
                                      Text(R.string.leader_board_date),
                                      Checkbox(
                                        key: null,
                                        onChanged: (_) => _controller.changeSortMode(SortMode.Date),
                                        value: _controller.isModeDate,
                                      )
                                    ],
                                  )
                              ),
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
                              children: _controller.submissions
                                  .map(_questContents)
                                  .toList()
                          )
                      )
                    ]
                )
            )
        )
    );
  }
}
