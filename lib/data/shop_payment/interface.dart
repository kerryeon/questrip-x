import 'package:flutter/material.dart';

/// 선택 카드에 표시할 데이터들을 관리하는 템플릿입니다.
///
/// 담당자: 구본근, 김호
///
mixin ISelectCardContent {

  /// 카드 정보를 바탕으로 카드 UI 를 생성합니다.
  Widget createUI();

}

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
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(top: 16.0, left: 8.0, right: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
          width: 320.0,
          height: 152.0,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.amberAccent,
            borderRadius: const BorderRadius.all(Radius.circular(8.0),
            ),
          ),
          child: GestureDetector(
              onTap: () => _onPressed(data),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: body,
              )
          )
      ),
    );
  }

}
