import 'package:flutter/material.dart';
import 'package:questrip/controller/lib.dart';
import 'package:questrip/lib.dart';

/// 생년월일 입력 화면의 동작을 담당합니다.
/// 사용자의 생년월일을 API 를 통해 불러옵니다.
///
/// 담당자: 김호
///
class CalendarController extends IController {

  /// 사용자의 생년월일을 묻는 다이얼로그를 띄웁니다.
  void getBirthday({
    DateTime initialDate,
    @required
    final void Function(DateTime) onSuccess,
    @required
    final Runnable onFailure,
  }) async {
    final DateTime now = DateTime.now();
    initialDate ??= DateTime(now.year - 20, now.month, now.day);
    final DateTime birthday = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1910),
      lastDate: DateTime.now(),
    );
    if (birthday == null) onFailure();
    else onSuccess(birthday);
  }

  /// 날짜 객체를 정수형으로 변환합니다.
  int dateTime2int(final DateTime birthday) {
    return birthday.year * 10000
        + birthday.month * 100
        + birthday.day;
  }

}
