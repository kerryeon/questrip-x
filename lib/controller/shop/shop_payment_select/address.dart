import 'package:flutter/material.dart';
import 'package:questrip/controller/shop/shop_payment.dart';
import 'package:questrip/controller/shop/shop_payment_select/interface.dart';
import 'package:questrip/data/shop_payment/address.dart';
import 'package:questrip/data/shop_payment/interface.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

/// 배송지 선택화면의 동작을 담당합니다.
///
/// 담당자: 정홍기
///
class ShopPaymentSelectAddressController extends IShopPaymentSelectController {

  /// 터치 이벤트가 추가된 선택 카드 목록을 반환합니다.
  @override
  List<ISelectCardContent> get cards => CardAddressContent.contents
      .map((content) => content.clone(_onSelect)).toList();

  /// 새로운 카드를 등록합니다.
  /// TODO to be implemented.
  void tryAddCard() async => dialog(context, R.string.debug_todo);

  /// 카드를 선택한 경우의 이벤트입니다.
  /// 선택한 카드 정보를 상위로 넘기고 이전화면으로 이동합니다.
  void _onSelect(final CardAddressContent content) {
    ShopPaymentController.cardAddress = content;
    Navigator.pop(context);
  }

}
