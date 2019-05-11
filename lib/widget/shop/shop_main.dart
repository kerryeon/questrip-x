import 'package:flutter/material.dart';
import 'package:questrip/controller/shop/shop_main.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';
import 'package:questrip/widget/common/components.dart';

/// 상점 메인화면을 담당하는 클래스입니다.
///
/// 담당자: 김호, 이동욱
///

class ShopMainState extends State<ShopMainWidget> {

  final ShopMainController _controller = ShopMainController();

  @override
  Widget build(BuildContext context) {
    _controller.init(context);
    return Scaffold(

    );
  }
}

class ShopMainWidget extends StatefulWidget {
  @override
  State<ShopMainWidget> createState() => ShopMainState();
}

