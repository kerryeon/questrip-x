import 'package:flutter/material.dart';
import 'package:questrip/controller/shop/shop_main.dart';
import 'package:questrip/data/product.dart';
import 'package:questrip/res/lib.dart';

/// 상품 컨텐츠 위젯입니다.
///
/// 담당자: 이동욱
///
class _ProductCard extends StatelessWidget {

  final Product product;

  _ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
          children: <Widget> [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(8.0))
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  // 이미지
                  Container(
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0)
                        ),
                        child: Image.network(
                          R.uri.pathImage + product.imagePath,
                          fit:BoxFit.cover,
                        ),
                      )
                  ),

                  // 상품명
                  Container(
                    padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                          product.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                          )
                      ),
                    ),
                  ),

                  // 가격
                  Container(
                    padding: const EdgeInsets.only(right: 8, bottom: 8),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text("${product.priceWon} 원"),
                    ),
                  ),

                ],
              ),
            ),

            // 상품갯수, 삭제 버튼
            // 이 요소들은 처음에 보여지지 않다가 이벤트 발생시 보여져야 합니다.
            Container(
              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    '${product.count}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                    )
                ),
              ),
            ),

            // 취소 버튼
            Container(
              constraints: BoxConstraints.expand(height: 40),
              padding: const EdgeInsets.all(0.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 40.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.do_not_disturb_on,
                      color: Colors.red,
                      size: 24.0,
                    ),
                    onPressed: null,
                  ),
                ),
              ),
            ),

          ]
      ),
    );
  }
}

/// 메인화면의 상점 정보 표시합니다.
/// 상호명, 물품 목록이 나열됩니다.
///
/// 담당자: 이동욱, 김호
///
class _ShopAboutState extends State<ShopAboutWidget> {

  final ShopAboutController _controller;

  _ShopAboutState(this._controller);

  @override
  Widget build(BuildContext context) {
    _controller.init(context, setState: setState);
    return Container(
      decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: const BorderRadius.only(
              topRight: const Radius.circular(32.0),
              topLeft: const Radius.circular(32.0))
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            // 상호명
            Container(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                    _controller.cName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32.0,
                    )
                )
            ),

            /// 물품 목록
            Container(
                height: 500,
                child: ListView(
                  children: (_controller.products ?? [])
                      .map((product) => _ProductCard(product))
                      .toList(),
                )
            ),

          ]
      ),
    );
  }
}

class ShopAboutWidget extends StatefulWidget {

  final ShopAboutController _controller;

  ShopAboutWidget(this._controller);

  @override
  State<ShopAboutWidget> createState() => _ShopAboutState(_controller);

}
