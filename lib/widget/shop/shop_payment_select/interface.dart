import 'package:flutter/material.dart';
import 'package:questrip/controller/shop/shop_payment_select/interface.dart';

/// 선택 카드 목록 UI 의 공통적인 부분을 구현한 클래스입니다.
/// 제네릭 타입 [C]는 해당 클래스의 컨트롤러를 의미합니다.
/// 제네릭 타입 [W]는 해당 화면을 표시하는 UI 클래스를 의미합니다.
///
/// 담당자: 구본근, 김호
///
class ShopPaymentSelectState<
  C extends IShopPaymentSelectController,
  W extends StatefulWidget> extends State<W> {

  final C _controller;

  /// 제목 텍스트
  final String _title;

  ShopPaymentSelectState(this._controller, this._title);

  @override
  Widget build(BuildContext context) {
    _controller.init(context, setState: setState);
    return Scaffold(
        appBar: AppBar(
            title: Text(_title)
        ),

        // 추가하기 버튼
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_circle),
          onPressed: _controller.tryAddCard,
        ),

        // 선택 카드 목록
        body: SingleChildScrollView(
          child: Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: _controller.cards
                    .map((card) => card.createUI())
                    .toList(),
              )
          ),
        )
    );
  }

}
