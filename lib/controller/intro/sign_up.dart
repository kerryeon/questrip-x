import 'package:flutter/material.dart';
import 'package:questrip/controller/intro/address.dart';
import 'package:questrip/controller/intro/calendar.dart';
import 'package:questrip/controller/lib.dart';
import 'package:questrip/data/account.dart';
import 'package:questrip/lib.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

/// 회원가입 화면의 동작을 담당합니다.
/// 필드값을 검사한 후, 약관 화면으로 이동합니다.
///
/// 담당자: 김호, 이동욱
///
class SignUpController extends IController {

  final AddressController _addressController = AddressController();
  final CalendarController _calendarController = CalendarController();

  final TextEditingController cNickname = new TextEditingController();
  final TextEditingController cYear = new TextEditingController();
  final TextEditingController cMonth = new TextEditingController();
  final TextEditingController cDay = new TextEditingController();
  final TextEditingController cAddress = new TextEditingController();
  final TextEditingController cAddressDetail = new TextEditingController();

  DateTime _mBirthday;

  /// 객체를 초기화합니다.
  void init(BuildContext context, {void Function(Runnable) setState}) async {
    super.init(context, setState: setState);
    _addressController.init(context, setState: setState);
    _calendarController.init(context, setState: setState);
  }

  /// 사용자가 다음 버튼을 눌렀을 경우의 이벤트입니다.
  void onNext() {
    _tryGetAccount()
        .then(_onSuccessGetAccount)
        .catchError(_onFailureGetAccount);
  }

  /// 사용자의 생년월일을 불러옵니다.
  void getBirthday() async
  => _calendarController.getBirthday(
          initialDate: _mBirthday,
          onSuccess: _onSuccessGetBirthday,
          onFailure: () {}
      );

  /// 사용자의 집주소를 불러옵니다.
  void getAddress() async
  => _addressController.getAddress(
        // 성공한 경우.
          _onSuccessGetAddress,
          // 실패한 경우.
              () {});

  /// 사용자 정보를 성공적으로 가져온 경우의 이벤트입니다.
  /// 정보를 저장하고, 다음 화면으로 이동합니다.
  void _onSuccessGetAccount(final Account account) {
    R.initAccount(account);
    Navigator.pushNamed(context, R.widget.terms);
  }

  /// 필드값에 이상이 있는 경우의 이벤트입니다.
  /// 이유를 알려주는 알림창을 띄웁니다.
  void _onFailureGetAccount(final Object code) {
    String msg;
    switch (code) {
      case InputCode.Nickname:
        msg = R.string.sign_up_alert_nickname;
        break;
      case InputCode.Birthday:
        msg = R.string.sign_up_alert_birthday;
        break;
      case InputCode.Address:
      case InputCode.AddressDetail:
        msg = R.string.sign_up_alert_address;
        break;
    }
    dialog(context, msg);
  }

  /// 사용자 정보값을 검사한 후 가져옵니다.
  Future<Account> _tryGetAccount() async {
    if (_mBirthday == null)
      throw(InputCode.Birthday);
    return Account(
      nickname: await _tryGetText(cNickname, InputCode.Nickname, minLength: 4, maxLength: 12),
      birthday: _calendarController.dateTime2int(_mBirthday),
      address: await _tryGetText(cAddress, InputCode.Address, minLength: 4),
      addressDetail: await _tryGetText(cAddressDetail, InputCode.AddressDetail, maxLength: 64),
    );
  }

  /// 필드값을 검사한 후 가져옵니다.
  Future<String> _tryGetText(TextEditingController controller, InputCode code, {
    int minLength,
    int maxLength,
  }) async {
    final text = controller.text;
    final length = text.length;
    if (minLength != null && length < minLength)
      throw(code);
    if (maxLength != null && length > maxLength)
      throw(code);
    return text;
  }

  /// 생년월일을 입력받은 경우, 이를 필드에 반영합니다.
  void _onSuccessGetBirthday(final DateTime birthday) {
    _mBirthday = birthday;
    setState(() {
      cYear.text = '${_mBirthday.year}';
      cMonth.text = '${_mBirthday.month}';
      cDay.text = '${_mBirthday.day}';
    });
  }

  /// 집주소를 입력받은 경우, 이를 필드에 반영합니다.
  void _onSuccessGetAddress(String address) {
    setState(() {
      cAddress.text = address;
    });
  }

}

/// 입력값 식별자입니다.
///
/// 담당자: 김호
enum InputCode {
  Nickname,
  Birthday,
  Address,
  AddressDetail,
}
