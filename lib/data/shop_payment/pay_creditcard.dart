import 'package:flutter/material.dart';
import 'package:questrip/data/shop_payment/interface.dart';
import 'package:questrip/data/shop_payment/pay_method.dart';
import 'package:questrip/widget/shop/shop_payment_select/pay_method.dart';

/// 결제 선택 카드에 신용카드 정보를 표시할 데이터들을 관리합니다.
///
/// 담당자: 정홍기
///
class Creditcard extends CardPayMethodContent with ISelectCardContent{

  final int id;

  final String method;
  final String info;
  final String number;
  final String valid;

  void Function(Creditcard) _onPressed;

  static List<CardPayMethodContent> contents = [
    Creditcard(3, "신용카드", "BC카드", "5353-1511-1123-1234", "03/21", null),
    Creditcard(1, "신용카드", "신한카드", "1234-1511-7546-1234", "01/20", null),
  ];

  Creditcard(this.id, this.method, this.info, this.number, this.valid, this._onPressed);

  /// 터치 이벤트를 추가한 새로운 객체를 생성합니다.
  @override
  Creditcard clone(_onPressed) => Creditcard(this.id, this.method, this.info, this.number, this.valid, _onPressed);

  @override
  Widget createUI() => CardPayMethod(this, _onPressed);

}