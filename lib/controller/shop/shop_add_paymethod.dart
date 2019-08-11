import 'package:flutter/material.dart';
import 'package:questrip/controller/lib.dart';
import 'package:questrip/lib.dart';


class AddPaymethodController extends IController{

  /// 카드사, 은행 콤보박스에 들어갈 데이터
  static List _creditcompany = ["BC카드", "현대카드", "NH농협", "IBK기업"];
  static List _bank = ["NH농협", "신한은행", "IBK기업", "KB국민"];

  /// 추가할 결제방식을 사용자에게 선택받기 위해 선언한 변수
  bool _creditcard = false;
  bool _bankbook = false;

  /// 카드사 리스트 콤보박스
  List<DropdownMenuItem<String>> creditdropdownmenuItem;
  List<DropdownMenuItem<String>> bankdropdownmenuItem;

  /// 현재 선택 된 카드사 및 은행
  String _currentCredit;
  String _currentBank;

  /// 현재 선택 된 카드사 및 은행 값 반환
  String get currentCredit => this._currentCredit;
  String get currentBank => this._currentBank;

  /// 현재 선택 된 결제 방식 값 반환
  bool get creditcard => this._creditcard;
  bool get bankbook => this._bankbook;

  /// 객체를 초기화합니다.
  void init(BuildContext context, {void Function(Runnable) setState}) async {
    super.init(context, setState: setState);
    creditdropdownmenuItem = getDropDownMenuItems(_creditcompany);
    bankdropdownmenuItem = getDropDownMenuItems(_bank);
    if(_currentCredit == null)
      _currentCredit = creditdropdownmenuItem[0].value;
    if(_currentBank == null)
      _currentBank = bankdropdownmenuItem[0].value;
  }

  /// 콤보박스 생성
  List<DropdownMenuItem<String>> getDropDownMenuItems(List contents) {
    List<DropdownMenuItem<String>> items = new List();
    for (String content in contents) {
      items.add(DropdownMenuItem(
          value: content,
          child: Text(content)
      ));
    }
    return items;
  }

  /// 신용카드 콤보박스 값 선택
  void changedCreditDropDownItem(String selected) {
    setState(() {
      _currentCredit = selected;
    });
  }

  /// 은행 콤보박스 값 선택
  void changeBankDropDownItem(String selected) {
    setState(() {
      _currentBank = selected;
    });
  }

  /// 추가할 모드로 변화
  void changed(bool visibility, String field) {
    setState(() {
      if (field == "creditcard"){
        _creditcard = visibility;
        _bankbook = false;
      }
      if (field == "bankbook"){
        _bankbook = visibility;
        _creditcard = false;
      }
    });
  }
}