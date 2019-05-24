import 'package:flutter/material.dart';
import 'package:questrip/controller/shop/shop_payment_select/address.dart';
import 'package:questrip/data/shop_payment/interface.dart';
import 'package:questrip/data/shop_payment/pay_method.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/shop/shop_payment_select/interface.dart';

/// 결제수단 선택 카드 UI 입니다.
///
/// 담당자: 구본근
///
class CardPayMethod extends ISelectCard<CardPayMethodContent> {

  CardPayMethod(card) : super(card);

  @override
  List<Widget> get body => <Widget> [

    // 결제수단
    Text(
        data.method,
        style: TextStyle(
          fontSize: 24.0,
        )
    ),

    // 구분선
    Divider(color: const Color(0xff000000)),

    // 결제수단 정보
    Text(
      data.info,
      style: TextStyle(
        fontSize: 16.0,
      ),
    ),

  ];

}

/// 결제수단 선택화면입니다.
///
/// 담당자: 구본근
///
class ShopPaymentSelectPayMethodWidget extends StatefulWidget {

  final ShopPaymentSelectAddressController _controller = ShopPaymentSelectAddressController();

  @override
  State<ShopPaymentSelectPayMethodWidget> createState() =>
      ShopPaymentSelectState(_controller, R.string.shop_payment_field_title_pay_method);

}
