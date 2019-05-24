import 'package:flutter/material.dart';
import 'package:questrip/data/shop_payment/interface.dart';
import 'package:questrip/widget/shop/shop_payment_select/address.dart';

/// 주소 선택 카드에 표시할 데이터들을 관리합니다.
///
/// 담당자: 구본근, 김호
///
class CardAddressContent with ISelectCardContent {

  String alias;
  String address;
  String addressDetail;

  CardAddressContent(this.alias, this.address, this.addressDetail);

  Widget createUI() => CardAddress(this);

}
