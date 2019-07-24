import "package:flutter/material.dart";
import 'package:questrip/controller/shop/shop_add_paymethod.dart';

/// 임시적으로 만들어 본 결제방식 추가 위젯화면 입니다.
class _CardAddPaymentState extends State<CardAddPaymentWidget> {

  final AddPaymethodController _controller;

  _CardAddPaymentState(this._controller);

  @override
  Widget build(BuildContext context){
    _controller.init(context, setState: setState);
    return Scaffold(
        appBar: AppBar(
          title: Text("결제방식 추가"),
        ),
        body:Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Container(
            margin: const EdgeInsets.only(left: 50.0, right: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.amber[200],
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Column(
                      children: <Widget>[
                        _controller.bankbook ? Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "카드사 :",
                                          style: TextStyle(
                                              fontSize: 15
                                          ),
                                        ),
                                        DropdownButton(
                                            value: _controller.currentCredit,
                                            items: _controller.creditdropdownmenuItem,
                                            onChanged: _controller.changedCreditDropDownItem
                                        )
                                      ],
                                    ),

                                    Row(
                                        children: <Widget>[
                                          Text("카드번호 :"),
                                          Flexible(
                                            child: TextField(maxLength: 4),
                                          ),
                                          Text("-"),
                                          Flexible(
                                            child: TextField(maxLength: 4),
                                          ),
                                          Text("-"),
                                          Flexible(
                                            child: TextField(maxLength: 4),
                                          ),
                                          Text("-"),
                                          Flexible(
                                            child: TextField(maxLength: 4),
                                          ),
                                        ]
                                    ),

                                    Row(
                                        children: <Widget>[
                                          Text("유효기한 :"),
                                          Flexible(
                                            child: TextField(
                                                decoration: InputDecoration(
                                                    labelText: "mm"
                                                ),
                                                maxLength: 2
                                            ),
                                          ),
                                          Text("/"),
                                          Flexible(
                                            child: TextField(
                                                decoration: InputDecoration(
                                                    labelText: "yy"
                                                ),
                                                maxLength: 2
                                            ),
                                          ),
                                          Spacer(flex: 2,)
                                        ]
                                    ),

                                  ],
                                )
                            ),
                          ],
                        ) : Container(),

                        _controller.creditcard ? Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          "은행 : ",
                                          style: TextStyle(
                                              fontSize: 15
                                          ),
                                        ),
                                        DropdownButton(
                                            value: _controller.currentBank,
                                            items: _controller.bankdropdownmenuItem,
                                            onChanged: _controller.changeBankDropDownItem
                                        )
                                      ],
                                    ),

                                    TextField(
                                      decoration: InputDecoration(
                                        labelText: "계좌번호",
                                      ),
                                      maxLength: 20,
                                    ),

                                  ],
                                )
                            ),
                          ],
                        ) : Container(),
                      ],

                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          _controller.bankbook ? null : _controller.changed(true, "bankbook");
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 16.0),
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.credit_card, color: _controller.bankbook ? Colors.amber[600] : Colors.amber[100]),
                              Container(
                                margin: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "신용카드",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                    color: _controller.bankbook ? Colors.amber[600] : Colors.amber[100],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                    SizedBox(width: 24.0),
                    InkWell(
                        onTap: () {
                          _controller.creditcard ? null : _controller.changed(true, "creditcard");
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 16.0),
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.bookmark, color: _controller.creditcard ? Colors.amber[600] : Colors.amber[100]),
                              Container(
                                margin: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "무통장입금",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                    color: _controller.creditcard ? Colors.amber[600] : Colors.amber[100],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ],
                ),
                Container(padding: EdgeInsets.all(10.0)),
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ButtonTheme(
                      minWidth: 200.0,
                      height: 40.0,
                      buttonColor: Colors.amber,
                      child: RaisedButton(
                          onPressed: () => {},
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          color: Colors.amber,
                          // 결제 버튼 메세지
                          child: Text(
                            "추가",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                            ),
                          )
                      )
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}

class CardAddPaymentWidget extends StatefulWidget {

  final AddPaymethodController _controller = AddPaymethodController();

  State<CardAddPaymentWidget> createState() => _CardAddPaymentState(_controller);
}