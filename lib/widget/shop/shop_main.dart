import 'package:flutter/material.dart';
import 'package:questrip/controller/shop/shop_main.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';
import 'package:questrip/widget/common/components.dart';

/// 상점 메인화면을 담당하는 클래스입니다.
///
/// 담당자: 김호, 이동욱
///

/// 상품 컨텐츠 위젯입니다.
class ProductCard extends StatelessWidget{
  var name;   // 상품이름
  var price;  // 상품가격
  var image;  // 상품 이미지
  var cnt = 0;    // 상품개수
  ProductCard(this.name, this.price, this.image);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
          children: <Widget> [
            Container(
              //padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.all(Radius.circular(8.0))
              ),
              width: 160,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      width: 160,
                      height: 160,
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.only(
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
                          image,
                          fit:BoxFit.cover,
                        ),
                      )
                  ),
                  /// 상품명
                  Container(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                          )
                      ),
                    ),
                  ),
                  /// 가격
                  Container(
                    padding: const EdgeInsets.only(right: 8, bottom: 8),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(price + "원"),
                    ),
                  ),
                ],
              ),
            ),

            /// 상품갯수, 삭제 버튼
            /// 이 요소들은 처음에 보여지지 않다가 이벤트 발생시 보여져야 합니다.
            Container(
              padding: const EdgeInsets.only(top : 8, left: 8, right: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    '$cnt',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                    )
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints.expand(width: 160, height: 40),
              padding: const EdgeInsets.all(0.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 40.0,
                  width: 40.0,
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

class ShopMainState extends State<ShopMainWidget> {

  final ShopMainController _controller = ShopMainController();

  @override
  Widget build(BuildContext context) {
    _controller.init(context);
    return Scaffold(
      body: SizedBox(
        height: 600.0,
        child: SingleChildScrollView(
          child: Container(
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
                  /// 총 금액
                  Container(
                    padding: EdgeInsets.only(top:24.0, left:24.0, right:24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                            "금액 : 4000000원",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),

                        /// 구매 버튼
                        RaisedButton(
                          key: null,
                          onPressed: null,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                            color: const Color(0xffffffff),
                          child: Text(
                            "구매",
                            style: TextStyle(
                              fontSize: 16.0,
                            )
                          )
                        )
                      ],
                    )
                  ),
                  Container(
                      padding: const EdgeInsets.all(24.0),
                      child: Text(
                          "상점",
                          textAlign:TextAlign.center,
                          style: TextStyle(
                            fontSize: 32.0,
                          )
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ProductCard("감자","256,000","https://iso.500px.com/wp-content/uploads/2015/10/lohi_cover.jpeg"),
                      ProductCard("포도","241,000","https://iso.500px.com/wp-content/uploads/2015/10/lohi_cover.jpeg"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ProductCard("취두부","156,000","https://iso.500px.com/wp-content/uploads/2015/10/lohi_cover.jpeg"),
                      ProductCard("오이","123,000","https://iso.500px.com/wp-content/uploads/2015/10/lohi_cover.jpeg"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ProductCard("가지","555,000","https://iso.500px.com/wp-content/uploads/2015/10/lohi_cover.jpeg"),
                      ProductCard("깻잎","1,980,000","https://iso.500px.com/wp-content/uploads/2015/10/lohi_cover.jpeg"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ProductCard("상추","22,994,000","https://iso.500px.com/wp-content/uploads/2015/10/lohi_cover.jpeg"),
                      ProductCard("굴","12,000","https://iso.500px.com/wp-content/uploads/2015/10/lohi_cover.jpeg"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ProductCard("오렌지","34,000","https://iso.500px.com/wp-content/uploads/2015/10/lohi_cover.jpeg"),
                      ProductCard("갈비","533,120,000","https://iso.500px.com/wp-content/uploads/2015/10/lohi_cover.jpeg"),
                    ],
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}

class ShopMainWidget extends StatefulWidget {
  @override
  State<ShopMainWidget> createState() => ShopMainState();
}

