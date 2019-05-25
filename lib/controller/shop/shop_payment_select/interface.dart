import 'package:questrip/controller/lib.dart';
import 'package:questrip/data/shop_payment/interface.dart';

/// 카드 선택 화면의 공통적인 동작을 담당합니다.
///
/// 담당자: 정홍기, 김호
///
abstract class IShopPaymentSelectController extends IController {

  /// 선택 카드 목록을 반환합니다.
  List<ISelectCardContent> get cards;

  /// 새로운 카드를 등록합니다.
  void tryAddCard();

}
