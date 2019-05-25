import 'package:flutter/material.dart';
import 'package:questrip/controller/shop/shop_payment_select/address.dart';
import 'package:questrip/data/shop_payment/address.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/shop/shop_payment_select/interface.dart';

/// 주소 선택 카드 UI 입니다.
///
/// 담당자: 구본근
///
class CardAddress extends ISelectCard<CardAddressContent> {

  CardAddress(card, _onPressed) : super(card, _onPressed);

  @override
  List<Widget> get body => <Widget> [

    // 별칭
    Text(
        data.alias,
        style: TextStyle(
          fontSize: 24.0,
        )
    ),

    // 구분선
    Divider(color: const Color(0xff000000)),

    // 주소
    Text(
      data.address,
      style: TextStyle(
        fontSize: 16.0,
      ),
    ),

    // 상세주소
    Text(
      data.addressDetail,
      style: TextStyle(
        fontSize: 16.0,
      ),
    ),

  ];

}

/// 배송지 선택화면입니다.
///
/// 담당자: 구본근
///
class ShopPaymentSelectAddressWidget extends StatefulWidget {

  final ShopPaymentSelectAddressController _controller = ShopPaymentSelectAddressController();

  @override
  State<ShopPaymentSelectAddressWidget> createState() =>
      ShopPaymentSelectState(_controller, R.string.shop_payment_field_title_address);

}
