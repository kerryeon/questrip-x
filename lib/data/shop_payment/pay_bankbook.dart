import 'package:flutter/material.dart';
import 'package:questrip/data/shop_payment/interface.dart';
import 'package:questrip/data/shop_payment/pay_method.dart';
import 'package:questrip/widget/shop/shop_payment_select/pay_method.dart';

/// 결제 선택 카드에 무통장입금 정보를 표시할 데이터들을 관리합니다.
///
/// 담당자: 정홍기
///
class Bankbook extends CardPayMethodContent with ISelectCardContent{

  final int id;

  final String method;
  final String info;
  final String number;

  void Function(Bankbook) _onPressed;

  static List<CardPayMethodContent> contents = [
    Bankbook(0,"무통장입금", "KB국민", "47315-151-19043-234", null),
    Bankbook(2,"무통장입금", "NH농협", "5353-1511-1123-1234", null),
  ];

  Bankbook(this.id, this.method, this.info, this.number, this._onPressed);

  /// 터치 이벤트를 추가한 새로운 객체를 생성합니다.
  @override
  Bankbook clone(_onPressed) => Bankbook(this.id, this.method, this.info, this.number, _onPressed);

  @override
  Widget createUI() => CardPayMethod(this, _onPressed);

}