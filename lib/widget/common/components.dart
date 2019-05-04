import 'package:flutter/material.dart';
import 'package:questrip/lib.dart';

/// 자주 사용하는 컴포넌트들을 정리합니다.
/// 
/// 담당자: 김호

/// 자주 사용하는 텍스트 스타일을 반환합니다.
TextStyle defaultTextStyle({
  final double fontSize = 15,
  final int color = 0xFF000000
}) => TextStyle(
    fontSize: fontSize,
    color: Color(color),
    fontWeight: FontWeight.w200,
    fontFamily: "Roboto"
);

/// [TextField] 형식이나 버튼 역할을 수행하는 위젯을 반환합니다.
TextField textFieldButton(context, {
  final controller,
  final String labelText,
  final TextStyle style,
  final Runnable onTap,
}) => TextField(
  controller: controller,
  enableInteractiveSelection: false,
  decoration: InputDecoration(
    labelText: labelText,
  ),
  style: defaultTextStyle(),
  onTap: () {
    onTap();
    FocusScope.of(context).requestFocus(new FocusNode());
  },
);
