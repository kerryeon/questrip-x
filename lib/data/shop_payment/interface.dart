import 'package:flutter/material.dart';

/// 선택 카드에 표시할 데이터들을 관리하는 템플릿입니다.
///
/// 담당자: 구본근, 김호
///
mixin ISelectCardContent {

  /// 카드 정보를 바탕으로 카드 UI 를 생성합니다.
  Widget createUI();

}
