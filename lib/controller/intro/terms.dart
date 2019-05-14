import 'package:flutter/material.dart';
import 'package:questrip/controller/lib.dart';
import 'package:questrip/net/client.dart';
import 'package:questrip/net/lib.dart';
import 'package:questrip/net/login/lib.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

/// 약관 보기 화면의 동작을 담당하는 클래스입니다.
/// 약관에 동의하면 서버에 회원가입을 요청합니다.
/// 가입이 승인되면 축하 메세지를 띄운 후, 메인화면으로 이동합니다.
///
/// 담당자: 김호, 이동욱
///
class TermsController extends IController {

  /// 사용자가 약관 동의 버튼을 눌렀을 경우의 이벤트입니다.
  /// 회원가입을 시도합니다.
  void onConfirmTerms() {
    btnLock();
    var data = R.account.toJSON();
    data['api'] = getApiName;
    requestAccept(R.uri.signUp, _onSuccess, _onFailure,
        data: data);
  }

  /// 회원가입에 성공한 경우의 이벤트입니다.
  /// 축하 메세지를 띄운 후, 메인화면으로 이동합니다.
  void _onSuccess() => dialog(context, R.string.terms_alert_welcome,
      onConfirm: () => Navigator.popAndPushNamed(context, R.widget.questMap));

  /// 회원가입에 실패한 경우의 이벤트입니다.
  /// 사용자에게 그 이유를 알립니다.
  void _onFailure(Failed f) => dialogFailed(context, f,
      rejected: R.string.terms_alert_rejected,
      onConfirm: btnUnlock);

}
