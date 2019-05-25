import 'package:flutter/material.dart';
import 'package:questrip/data/shop_payment/interface.dart';
import 'package:questrip/widget/shop/shop_payment_select/address.dart';

/// 주소 선택 카드에 표시할 데이터들을 관리합니다.
///
/// 담당자: 구본근, 김호
///
class CardAddressContent with ISelectCardContent {

  final int id;

  final String alias;
  final String address;
  final String addressDetail;

  final void Function(CardAddressContent) _onPressed;

  /// TODO to be implemented.
  /// 사용자가 등록한 카드 목록입니다.
  static List<CardAddressContent> contents = [
    CardAddressContent(0, "집", "경남 진주시 가좌동 479-18", "이룸빌2 ***호", null),
    CardAddressContent(1, "직장", "경남 진주시 진주대로 501", "경상대학교 30동 510호", null),
  ];

  /// 사용자가 자주 사용하는 카드입니다.
  static CardAddressContent primary = contents[0];

  const CardAddressContent(this.id, this.alias, this.address, this.addressDetail, this._onPressed);

  /// 터치 이벤트를 추가한 새로운 객체를 생성합니다.
  CardAddressContent clone(_onPressed) => CardAddressContent(
      this.id, this.alias, this.address, this.addressDetail, _onPressed,
  );

  @override
  Widget createUI() => CardAddress(this, _onPressed);

}
