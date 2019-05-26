import 'package:flutter/material.dart';
import 'package:questrip/controller/shop/shop_about_seller.dart';
import 'package:questrip/res/lib.dart';

/// 상점 판매자 정보 화면입니다.
///
/// 담당자: 김호
///
class _ShopAboutSellerState extends State {

  final ShopAboutSellerController _controller = ShopAboutSellerController();

  @override
  Widget build(BuildContext context) {
    _controller.init(context, setState: setState);
    return Scaffold(
        appBar: AppBar(
            title: Text(R.string.shop_about_seller_field_title)
        ),

        // 선택 카드 목록
        body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: <Widget> [
                  _mapText('${R.string.shop_about_seller_field_name_shop}: ${_controller.cName}'),
                  _mapText('${R.string.shop_about_seller_field_name_seller}: ${_controller.cSellerName}'),
                  _mapText('${R.string.shop_about_seller_field_contact}: ${_controller.cSellerPhone}'),
                ],
              )
          ),
        )
    );
  }

  /// 판매자 정보를 UI 로 변환합니다.
  Widget _mapText(final String message) => Card(
      margin: const EdgeInsets.only(top: 16.0, left: 24.0, right: 24.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.amber[100],
          borderRadius: const BorderRadius.all(Radius.circular(8.0),
          ),
        ),
        child: Text(message),
      )
  );

}

class ShopAboutSellerWidget extends StatefulWidget {

  State createState() => _ShopAboutSellerState();

}
