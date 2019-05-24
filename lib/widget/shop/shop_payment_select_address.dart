import 'package:flutter/material.dart';
import 'package:questrip/controller/shop/shop_payment_select_address.dart';
import 'package:questrip/widget/shop/shop_payment.dart';

class ShopPaymentSelectAddressWidget extends StatefulWidget {

  final ShopPaymentSelectAddressController _controller = ShopPaymentSelectAddressController();

  @override
  State<ShopPaymentSelectAddressWidget> createState() => ShopPaymentSelectAddressState(_controller, "배송지 선택");
}

class ShopPaymentSelectAddressState extends State<ShopPaymentSelectAddressWidget>{
  final ShopPaymentSelectAddressController _controller;
  final String appbar_title;
  final CardAddressContents card1 = CardAddressContents("직장","경남 진주시 진주대로 501", "경상대학교 30동 510호");
  final CardAddressContents card2 = CardAddressContents("집","경남 진주시 가좌동 479-18", "이룸빌2 ***호");

  ShopPaymentSelectAddressState(this._controller, this.appbar_title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(appbar_title)
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_circle),
          onPressed: null,
        ),
        body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  CardList<CardAddressContents>([card1, card2]),
                ],
              )
          ),
        )
    );
  }
}
