import 'package:flutter/material.dart';
import 'package:questrip/controller/about/about_view.dart';
import 'package:questrip/widget/board/leader_board.dart';

/// 사용자의 퀘스트 도전 목록을 나열하는 화면입니다.
/// 사용자가 이때껏 도전한 퀘스트 제출물들을 볼 수 있습니다.
/// 제출물은 추천순, 최신순 두 가지 조건에 따라 정렬할 수 있습니다.
///
/// 담당자: 이동욱, 김호
///
class AboutViewWidget extends StatefulWidget {
  State createState() => LeaderBoardState(AboutViewController());
}
