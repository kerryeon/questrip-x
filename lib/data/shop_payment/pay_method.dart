import 'package:flutter/material.dart';
import 'package:questrip/data/shop_payment/interface.dart';
import 'package:questrip/widget/shop/shop_payment_select/pay_method.dart';

/// 결제수단 선택 카드에 표시할 데이터들을 관리합니다.
///
/// 담당자: 구본근, 김호
///
class CardPayMethodContent with ISelectCardContent {

  String method;
  String info;

  CardPayMethodContent(this.method, this.info);

  Widget createUI() => CardPayMethod(this);

}
