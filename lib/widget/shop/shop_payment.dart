import 'package:flutter/material.dart';
import 'package:questrip/controller/shop/shop_payment.dart';
import 'package:questrip/res/lib.dart';

/// 결제 진행화면입니다.
/// 배송지, 결제수단을 선택할 수 있습니다.
/// 주문할 상품들과 총 주문금액을 요약하여 보여줍니다.
/// 약관에 동의하여 결제를 시도할 수 있습니다.
///
/// 담당자: 이동욱, 구본근, 김호
///
class _ShopPaymentState extends State<ShopPaymentWidget> {

  final ShopPaymentController _controller;

  _ShopPaymentState(this._controller);

  @override
  Widget build(BuildContext context) {
    _controller.init(context, setState: setState);
    return Scaffold(
        appBar: AppBar(
            title: Text(R.string.shop_payment_field_title)
        ),
        body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[

                  // 선택 카드 목록
                  Column(
                    children: _controller.cards
                        .map((card) => card.createUI())
                        .toList(),
                  ),

                  // 총 주문금액
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                        "${R.string.shop_payment_field_total_price} : "
                            "${_controller.cTotalPrice}"
                            "${R.string.shop_unit_money}",
                        style: TextStyle(
                          fontSize: 16.0,
                        )
                    ),
                  ),

                  // 약관 동의 메세지
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        R.string.shop_payment_field_agree,
                        style: TextStyle(
                          fontSize: 12.0,
                        )
                    ),
                  ),

                  // 결제 버튼
                  Container(
                    child: ButtonTheme(
                        minWidth: 200.0,
                        height: 40.0,
                        buttonColor: Colors.amber,
                        child: RaisedButton(
                            onPressed: _controller.tryOrder,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                            color: Colors.amber,
                            // 결제 버튼 메세지
                            child: Text(
                              R.string.shop_payment_button_order,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white
                              ),
                            )
                        )
                    ),
                  )

                ],
              )
          ),
        )
    );
  }

}

class ShopPaymentWidget extends StatefulWidget {

  final ShopPaymentController _controller = ShopPaymentController();

  @override
  State<ShopPaymentWidget> createState() => _ShopPaymentState(_controller);

}
