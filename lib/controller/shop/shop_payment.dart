import 'package:flutter/material.dart';
import 'package:questrip/controller/lib.dart';
import 'package:questrip/data/product.dart';
import 'package:questrip/data/shop_payment/address.dart';
import 'package:questrip/data/shop_payment/interface.dart';
import 'package:questrip/data/shop_payment/pay_method.dart';
import 'package:questrip/lib.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';
import 'package:questrip/widget/common/input.dart';
import 'package:questrip/widget/shop/shop_payment_loading.dart';

/// 결제 진행화면의 동작을 담당합니다.
///
/// 담당자: 김호
///
class ShopPaymentController extends IController {

  // 선택 카드 목록
  static CardAddressContent cardAddress;
  static CardPayMethodContent cardPayMethod;

  /// 구매 목록
  static List<Product> products;

  /// 결제 진행중 레이아웃
  OverlayEntry _overlayEntry;

  /// 선택 카드 목록을 반환합니다.
  List<ISelectCardContent> get cards => [
    cardAddress.clone(_gotoSelectAddress),
    cardPayMethod.clone(_gotoSelectPayMethod),
  ];

  /// 객체를 초기화합니다.
  @override
  void init(BuildContext context, {void Function(Runnable) setState}) async {
    super.init(context, setState: setState);
    cardAddress = (cardAddress ?? CardAddressContent.primary ?? null);
    cardPayMethod = (cardPayMethod ?? CardPayMethodContent.primary ?? null);
  }

  /// 주문 절차를 진행합니다.
  void tryOrder() async {
    // 결제가 진행중이라는 창을 띄웁니다.
    _overlayEntry = _showOverlayLoading();
    // 주문을 요청합니다.
    _tryOrder();
  }

  /// 선택한 상품의 수량을 조절합니다.
  /// 0 으로 설정한다면, 목록에서 제거합니다.
  void editCount(final Product product) => dialogRangeSlider(context,
    msg: R.string.shop_about_field_max_value(Product.COUNT_MAX.toString()),
    initValue: product.count,
    maxValue: Product.COUNT_MAX,
    onSelect: (count) {
      // 제외
      if (count == 0) {
        products.remove(product);
        // 구매할 상품이 없다면 결제화면을 빠져나옵니다.
        if (products.length == 0) {
          Navigator.pop(context);
          return;
        }
      }
      // 수량 조절
      else product.count = count;
      setState(() {});
    },
  );

  /// 총 주문금액을 반환합니다.
  String get cTotalPrice => formatPrice(products
      .map((product) => product.totalPrice)
      .reduce((a, b) => a + b)
  );

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

  /// 배송지 선택화면으로 이동합니다.
  void _gotoSelectAddress(_) => Navigator.pushNamed(context, R.widget.shopSelectAddress);

  /// 결제수단 선택화면으로 이동합니다.
  void _gotoSelectPayMethod(_) => Navigator.pushNamed(context, R.widget.shopSelectPayMethod);

}
