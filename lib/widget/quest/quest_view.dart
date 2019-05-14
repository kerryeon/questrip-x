import 'package:flutter/material.dart';
import 'package:questrip/controller/quest/quest_view.dart';
import 'package:questrip/widget/board/leader_board.dart';

/// 퀘스트 목록의 동작을 담당하는 클래스입니다.
/// 퀘스트의 제출물들을 특정한 순서대로 보여줍니다.
/// 추천순, 최신순으로 정렬하여 볼 수 있습니다.
/// 그 외에 퀘스트를 제출하거나, 추천, 신고할 수 있습니다.
///
/// 담당자: 김호
///
class QuestViewWidget extends StatefulWidget {
  State createState() => LeaderBoardState(QuestViewController());
}
