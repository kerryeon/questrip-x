import 'package:questrip/controller/shop/shop_payment_select/interface.dart';
import 'package:questrip/data/shop_payment/address.dart';
import 'package:questrip/data/shop_payment/interface.dart';

/// 배송지 선택화면의 동작을 담당합니다.
///
/// 담당자: 정홍기
///
class ShopPaymentSelectAddressController extends IShopPaymentSelectController {

  /// 선택 카드 목록을 반환합니다.
  @override
  List<ISelectCardContent> get cards => [
    // TODO to be implemented.
    CardAddressContent("직장", "경남 진주시 진주대로 501", "경상대학교 30동 510호"),
    CardAddressContent("집", "경남 진주시 가좌동 479-18", "이룸빌2 ***호"),
  ];

  /// 새로운 카드를 등록합니다.
  /// TODO to be implemented.
  void tryAddCard() async {}

}
