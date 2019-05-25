import 'package:flutter/material.dart';
import 'package:questrip/data/shop_payment/interface.dart';
import 'package:questrip/widget/shop/shop_payment_select/pay_method.dart';

/// 결제수단 선택 카드에 표시할 데이터들을 관리합니다.
///
/// 담당자: 구본근, 김호
///
class CardPayMethodContent with ISelectCardContent {

  final int id;

  final String method;
  final String info;

  final void Function(CardPayMethodContent) _onPressed;

  // TODO to be implemented.
  static List<CardPayMethodContent> contents = [
    CardPayMethodContent(0, "신용카드", "NH농협 5353-1511-1123-1234", null),
    CardPayMethodContent(1, "무통장입금", "경남은행 700-21-0011532", null),
  ];

  /// 사용자가 자주 사용하는 카드입니다.
  static CardPayMethodContent primary = contents[0];

  const CardPayMethodContent(this.id, this.method, this.info, this._onPressed);

  /// 터치 이벤트를 추가한 새로운 객체를 생성합니다.
  CardPayMethodContent clone(_onPressed) => CardPayMethodContent(
    this.id, this.method, this.info, _onPressed,
  );

  @override
  Widget createUI() => CardPayMethod(this, _onPressed);

}
