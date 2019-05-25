import 'package:flutter/material.dart';
import 'package:questrip/controller/shop/shop_payment_select/interface.dart';

/// 카드 기본 UI 입니다.
/// 제네릭 타입 [T]는 카드의 정보를 담고 있어야 합니다.
///
/// 담당자: 이동욱, 구본근, 김호
///
abstract class ISelectCard<T> extends StatelessWidget {

  final T data;

  @protected
  final void Function(T) _onPressed;

  ISelectCard(this.data, this._onPressed);

  @protected
  List<Widget> get body;

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: GestureDetector(
      onTap: () => _onPressed(data),
      child: Container(
          width: 320.0,
          height: 152.0,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: const BorderRadius.all(Radius.circular(8.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: body,
          )
      ),
    ),
  );

}

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
