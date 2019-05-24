import 'package:flutter/material.dart';
import 'package:questrip/controller/lib.dart';
import 'package:questrip/data/shop_payment/address.dart';
import 'package:questrip/data/shop_payment/interface.dart';
import 'package:questrip/data/shop_payment/pay_method.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';
import 'package:questrip/widget/shop/shop_payment_loading.dart';

/// 결제 진행화면의 동작을 담당합니다.
///
/// 담당자: 김호
///
class ShopPaymentController extends IController {

  // 선택 카드 목록
  final CardAddressContent _cardAddress = CardAddressContent("학교", "경상남도 진주시 진주대로 501 경상대학교", "30동 310호");
  final CardPayMethodContent _cardPayMethod = CardPayMethodContent("신용카드", "NH농협 5353-1511-1123-1234");

  /// TODO to be implemented.
  /// 총 주문금액을 반환합니다.
  String get cTotalPrice => 45400.toString();

  /// 결제 진행중 레이아웃
  OverlayEntry _overlayEntry;

  /// 선택 카드 목록을 반환합니다.
  List<ISelectCardContent> get cards => [
    _cardAddress,
    _cardPayMethod,
  ];

  /// 주문 절차를 진행합니다.
  void tryOrder() async {
    // 결제가 진행중이라는 창을 띄웁니다.
    _overlayEntry = _showOverlayLoading();
    // 주문을 요청합니다.
    _tryOrder();
  }

  /// 주문이 진행중이라는 창을 띄웁니다.
  OverlayEntry _showOverlayLoading() {
    OverlayState state = Overlay.of(context);
    OverlayEntry entry = OverlayEntry(
        builder: (BuildContext context) =>
            Scaffold(
              body: Container(
                decoration: BoxDecoration(
                    color: Color(0xfff2f2f2)
                ),
                child: ShopPaymentLoading(),
              ),
            )
    );
    state.insert(entry);
    // 화면을 갱신합니다.
    setState(() {});
    return entry;
  }

  /// 주문에 성공한 경우의 이벤트입니다.
  /// 사용자에게 결제가 성공했다고 알린 후, 결제 화면을 빠져나갑니다.
  void _onSuccessOrder() async {
    // 결제 진행중 레이아웃은 이제 제거합니다.
    _overlayEntry.remove();
    // 결제 성공 알림창을 띄웁니다.
    dialog(context,
      R.string.shop_payment_field_ordered,
      // 결제 화면을 빠져나갑니다.
      onConfirm: () => Navigator.pop(context),
    );
  }

  /// 서버에 상품 주문을 요청합니다.
  void _tryOrder() async {
    // TODO to be implemented.
    Future.delayed(
      Duration(seconds: 3),
      _onSuccessOrder,
    );
  }

}
