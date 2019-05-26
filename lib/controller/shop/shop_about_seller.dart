import 'package:flutter/material.dart';
import 'package:questrip/controller/lib.dart';
import 'package:questrip/data/seller.dart';
import 'package:questrip/data/shop.dart';
import 'package:questrip/lib.dart';
import 'package:questrip/net/client.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

/// 상점 판매자 정보 화면의 동작을 담당합니다.
///
/// 담당자: 김호
///
class ShopAboutSellerController extends IController {

  static Shop shop;

  Seller _seller;

  String get cName => shop.name;
  String get cSellerName => _seller != null ? _seller.name : '';
  String get cSellerPhone => _seller != null ? _seller.cPhoneKorean : '';

  @override
  void init(BuildContext context, {void Function(Runnable) setState}) async {
    super.init(context, setState: setState);
    _tryGetSeller();
  }

  /// 서버에 판매자 정보 조회를 요청합니다.
  void _tryGetSeller() async => request(
    R.uri.sellerAbout,
    _onSuccessGetSeller,
        (f) => dialogFailed(context, f,
            onConfirm: () => Navigator.pop(context)
        ),
    data: {
      'seller_id': shop.sellerId,
    },
  );

  /// 서버로부터 판매자 정보를 전송받은 경우의 이벤트입니다.
  /// 정보를 저장하고 화면을 갱신합니다.
  void _onSuccessGetSeller(final Map<String, Object> response) async {
    _seller = Seller.fromJSON(response);
    setState(() {});
  }

}
