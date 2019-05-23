import 'package:flutter/material.dart';
import 'package:questrip/controller/shop/shop_payment_select_pay_method.dart';
import 'package:questrip/widget/shop/shop_payment.dart';

class ShopPaymentSelectPayMethodWidget extends StatefulWidget {

  final ShopPaymentSelectPayMethodController _controller = ShopPaymentSelectPayMethodController();

  @override
  State<ShopPaymentSelectPayMethodWidget> createState() => ShopPaymentSelectPayMethodState(_controller, "결제수단 선택");
}

class ShopPaymentSelectPayMethodState extends State<ShopPaymentSelectPayMethodWidget>{
  final ShopPaymentSelectPayMethodController _controller;
  final String appbar_title;
  final CardPayMethodContents card1 = CardPayMethodContents("카드","NH 농협 5353-1511-1123-1234");
  final CardPayMethodContents card2 = CardPayMethodContents("카드","신한은행 4421-5342-2134-1234");
  final CardPayMethodContents card3 = CardPayMethodContents("무통장입금","무통장입금");

  ShopPaymentSelectPayMethodState(this._controller, this.appbar_title);

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
                  CardList<CardPayMethodContents>([card1, card2, card3]),
                ],
              )
          ),
        )
    );
  }
}
