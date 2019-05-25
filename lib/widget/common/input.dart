import 'package:flutter/material.dart';
import 'package:questrip/res/lib.dart';

/// 범위 내의 정수값 하나를 입력받을 수 있는 알림창 UI 입니다.
///
/// 담당자: 김호, 이동욱
///
class _DialogRangeSliderState extends State<_DialogRangeSlider> {

  final BuildContext context;

  final String title;
  final String msg;
  final ValueChanged<int> onSelect;

  final int maxValue;

  int value;

  _DialogRangeSliderState(this.context, this.title, this.msg, this.onSelect, this.maxValue, this.value);

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text(title ?? R.string.common_alert_select),
    content: Container(
      height: 84,
      child: Column(
        children:
        // 메세지
        (msg != null ? <Widget>[Text(msg,
          style: TextStyle(
            fontSize: 12,
          ),
        )] : []) + <Widget>[

          // 입력바
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Slider(
              min: 0,
              max: maxValue.toDouble(),
              value: value.toDouble(),
              // divisions: 1,
              onChanged: (v) => setState(() => value = v.round()),
            ),
          ),
          // 현재값
          Text(value.toString()),
        ],
      ),
    ),
    actions: <Widget>[
      // 확인 버튼
      FlatButton(
          child: Text(R.string.common_alert_confirm),
          onPressed: () {
            Navigator.of(context).pop();
            if (onSelect != null) onSelect(value);
          }
      ),
    ],
  );

}

class _DialogRangeSlider extends StatefulWidget {

  final BuildContext context;

  final String title;
  final String msg;
  final ValueChanged<int> onSelect;

  final int initValue;
  final int maxValue;

  const _DialogRangeSlider(this.context, this.title, this.msg, this.onSelect, this.maxValue, this.initValue);

  @override
  _DialogRangeSliderState createState() => _DialogRangeSliderState(
      context, title, msg, onSelect, maxValue, initValue,
  );

}

/// 범위 내의 정수값 하나를 입력받을 수 있는 알림창을 띄웁니다.
void dialogRangeSlider(final BuildContext context, {
  final String title,
  final String msg,
  final ValueChanged<int> onSelect,
  final int initValue,
  final int maxValue,
}) async => showDialog(
  context: context,
  builder: (context) => _DialogRangeSlider(
      context, title, msg, onSelect, maxValue, initValue,
  ),
);
