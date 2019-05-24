import 'package:flutter/material.dart';
import 'package:questrip/res/lib.dart';

/// 결제가 진행중일 때 표시하는 화면입니다.
/// 결제가 완료될 때까지 사용자의 입력을 제한합니다.
///
/// 담당자: 정홍기
///
class _ShopPaymentLoadingState extends State<ShopPaymentLoading> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.center,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.amber[500],
                  borderRadius: BorderRadius.circular(10.0)
              ),
              width: 300.0,
              height: 200.0,
              alignment: AlignmentDirectional.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  // 로딩 애니메이션
                  Center(
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 7.0,
                      ),
                    ),
                  ),

                  // 결제중 메세지
                  Container(
                    margin: const EdgeInsets.only(top: 25.0),
                    child: Center(
                      child: Text(
                        R.string.shop_payment_field_loading,
                        style: TextStyle(
                            fontSize: 17.0,
                            color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

class ShopPaymentLoading extends StatefulWidget {

  @override
  _ShopPaymentLoadingState createState() =>_ShopPaymentLoadingState();

}
