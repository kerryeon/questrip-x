import 'package:flutter/material.dart';
import 'package:questrip/data/shop_payment/interface.dart';
import 'package:questrip/data/shop_payment/pay_creditcard.dart';
import 'package:questrip/data/shop_payment/pay_bankbook.dart';
import 'package:questrip/widget/shop/shop_payment_select/pay_method.dart';

/// 결제수단 선택 카드에 표시할 데이터들을 관리합니다.
///
/// 담당자: 구본근, 김호
///
abstract class CardPayMethodContent with ISelectCardContent {

  int id;

  String method;
  String info;
  String number;

  void Function(CardPayMethodContent) _onPressed;

  static List<CardPayMethodContent> contents =
      Creditcard.contents.toList() + Bankbook.contents.toList();

  /// 사용자가 자주 사용하는 카드입니다.
  static CardPayMethodContent primary = contents[0];

  CardPayMethodContent();

  /// 터치 이벤트를 추가한 새로운 객체를 생성합니다.
  CardPayMethodContent clone(_onPressed);

  @override
  Widget createUI() => CardPayMethod(this, _onPressed);

}
