import 'dart:math';

import 'package:flutter/material.dart';
import 'package:questrip/controller/anim/slide.dart';
import 'package:questrip/controller/lib.dart';
import 'package:questrip/controller/shop/shop_about_seller.dart';
import 'package:questrip/controller/shop/shop_payment.dart';
import 'package:questrip/data/product.dart';
import 'package:questrip/data/shop.dart';
import 'package:questrip/net/client.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';
import 'package:questrip/widget/common/input.dart';

/// 상점 화면의 동작을 담당합니다.
///
/// 담당자: 김호, 이동욱
///
class ShopAboutController extends IController with SlideAnimation {

  String cName = "";
  String cDescription = "";

  Shop _shop;

  List<Product> products;

  /// 레이아웃을 보여줍니다.
  void showAbout(final Shop quest) {
    _shop = quest;
    _tryLoadProducts();
    _update();
    show();
  }

  /// 결제 진행화면으로 이동합니다.
  void gotoOrder() async {
    // 구매할 상품만 결제 진행화면으로 넘깁니다.
    ShopPaymentController.products = products
        .where((product) => product.count > 0)
        .toList();
    // 구매할 상품이 있는 경우에만 넘어갑니다.
    if (ShopPaymentController.products.length > 0) {
      // 현재 창은 숨깁니다.
      hide();
      Navigator.pushNamed(context, R.widget.shopPayment);
    }
  }

  /// 판매자 정보 화면으로 이동합니다.
  void showAboutSeller() {
    ShopAboutSellerController.shop = _shop;
    Navigator.pushNamed(context, R.widget.shopAboutSeller);
  }

  /// 선택한 상품을 구매목록에 하나 추가합니다.
  void addCount(final Product product) => _setCount(product, product.count + 1);

  /// 선택한 상품을 구매목록에 원하는 갯수만큼 추가합니다.
  /// 구매 갯수를 입력받는 알림창을 띄웁니다.
  void addCountManual(final Product product) => dialogRangeSlider(context,
    msg: R.string.shop_about_field_max_value(Product.COUNT_MAX.toString()),
    initValue: product.count,
    maxValue: Product.COUNT_MAX,
    onSelect: (count) => _setCount(product, count),
  );

  /// 선택한 상품을 구매목록에서 제거합니다.
  void removeCount(final Product product) => _setCount(product, 0);

  /// 선택한 상품을 특정 수량만큼 추가합니다.
  void _setCount(final Product product, final int count) {
    product.count = min(max(count, 0), Product.COUNT_MAX);
    setState(() {});
  }

  /// 주어진 정보를 토대로 화면을 갱신합니다.
  void _update() async {
    cName = _shop.name;
    cDescription = _shop.description;
  }

  /// 물품 목록을 불러옵니다.
  /// 만약 실패하면, 그 이유를 알려줍니다.
  @protected
  void _tryLoadProducts() async => request(
      R.uri.shopView, _onLoad,
          (e) => dialogFailed(context, e),
      data: {
        'shop_id': _shop.id,
      }
  );

  /// 물품 목록을 성공적으로 불러온 경우의 이벤트입니다.
  void _onLoad(final Map<String, Object> response) async {
    final List<Object> raw = response['list'];
    products = raw.map((q) => Product.fromJSON(q)).toList();
    // 화면을 갱신합니다.
    setState(() {});
  }

  @override
  Offset get defaultOffset => SliderAnimationOffset.bottomLayout;

}
