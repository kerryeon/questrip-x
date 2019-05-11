import 'package:flutter/material.dart';
import 'package:questrip/controller/board/leader_board.dart';
import 'package:questrip/data/submission.dart';
import 'package:questrip/res/lib.dart';

class LeaderBoardState extends State<StatefulWidget> {

  final ILeaderBoardController _controller;

  LeaderBoardState(this._controller);

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
          ),
          /// TODO to be implemented [Vote, Report]
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
