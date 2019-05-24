import 'package:questrip/controller/shop/shop_payment_select/interface.dart';
import 'package:questrip/data/shop_payment/interface.dart';
import 'package:questrip/data/shop_payment/pay_method.dart';

/// 결제수단 선택화면의 동작을 담당합니다.
///
/// 담당자: 정홍기
///
class ShopPaymentSelectPayMethodController extends IShopPaymentSelectController {

  /// 선택 카드 목록을 반환합니다.
  @override
  List<ISelectCardContent> get cards => [
    // TODO to be implemented.
    CardPayMethodContent("신용카드", "NH농협 5353-1511-1123-1234"),
    CardPayMethodContent("무통장입금", "경남은행 700-21-0011532"),
  ];

  /// 새로운 카드를 등록합니다.
  /// TODO to be implemented.
  void tryAddCard() async {}

}
