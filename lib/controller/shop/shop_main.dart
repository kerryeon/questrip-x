import 'package:flutter/material.dart';
import 'package:questrip/controller/anim/slide.dart';
import 'package:questrip/controller/lib.dart';
import 'package:questrip/data/product.dart';
import 'package:questrip/data/shop.dart';
import 'package:questrip/net/client.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

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
