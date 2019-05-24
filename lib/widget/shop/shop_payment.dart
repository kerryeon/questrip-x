import 'package:flutter/material.dart';
import 'package:questrip/controller/shop/shop_payment.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/shop/shop_payment_loading.dart';

/// 카드 메인 컨텐츠
class CardMainContents {
  String title;
  String contents;
  CardMainContents(this.title, this.contents);
}

/// 카드 주소 컨텐츠
class CardAddressContents {
  String location;
  String address;
  String detail_address;
  CardAddressContents(this.location, this.address, this.detail_address);
}

/// 카드 결제수단 컨텐츠
class CardPayMethodContents {
  String method;
  String info;
  CardPayMethodContents(this.method, this.info);
}

/// 결제 메인화면 카드 UI
class CardMain extends _CardUI<CardMainContents> {

  CardMain(card) : super(card);

  @override
  List<Widget> get body => <Widget>[
    Text(
        card.title,
        style: TextStyle(
          fontSize: 24.0,
        )
    ),
    Divider(color: const Color(0xff000000)),
    Text(
      card.contents,
      style: TextStyle(
        fontSize: 16.0,
      ),
    )
  ];
}

/// 주소 선택 카드 UI
class CardAddress extends _CardUI<CardAddressContents> {

  CardAddress(card) : super(card);

  @override
  List<Widget> get body => <Widget>[
    Text(
        card.location,
        style: TextStyle(
          fontSize: 24.0,
        )
    ),
    Divider(color: const Color(0xff000000)),
    Text(
      card.address,
      style: TextStyle(
        fontSize: 16.0,
      ),
    ),
    Text(
      card.detail_address,
      style: TextStyle(
        fontSize: 16.0,
      ),
    ),
  ];
}

/// 결제수단 선택 카드 UI
class CardPayMethod extends _CardUI<CardPayMethodContents> {

  CardPayMethod(card) : super(card);

  @override
  List<Widget> get body => <Widget>[
    Text(
        card.method,
        style: TextStyle(
          fontSize: 24.0,
        )
    ),
    Divider(color: const Color(0xff000000)),
    Text(
      card.info,
      style: TextStyle(
        fontSize: 16.0,
      ),
    )
  ];
}


/// 카드 기본 UI
abstract class _CardUI<T> extends StatelessWidget {

  final T card;

  _CardUI(this.card);

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: body,
        )
      ),
    );
  }
}

/// 카드 리스트
class CardList<T> extends StatelessWidget{

  List<T> card;

  CardList(this.card);
  Widget getCardUI(card) {
    if(T==CardMainContents)
      return CardMain(card);
    if(T==CardAddressContents)
      return CardAddress(card);
    if(T==CardPayMethodContents)
      return CardPayMethod(card);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          getCardUI(card[0]),
          getCardUI(card[1]),
        ],
      ),
    );
  }
}

class ShopPaymentWidget extends StatefulWidget {

  final ShopPaymentController _controller = ShopPaymentController();

  @override
  State<ShopPaymentWidget> createState() => ShopPaymentState(_controller, "주문/결제", 58500);
}

class ShopPaymentState extends State<ShopPaymentWidget>{
  final ShopPaymentController _controller;
  final String appbar_title;
  final int total_price;
  bool _loading = false;

  // 카드 객체 생성 후 정보를 작성합니다. 필드는 타이틀(title)과 내용(contents)으로 이루어집니다. (title, contents)
  final CardMainContents card1 = CardMainContents("배송지", "경상남도 진주시 진주대로 501 경상대학교 30동 310호");
  final CardMainContents card2 = CardMainContents("결제수단", "NH농협 5353-1511-1123-1234");

  ShopPaymentState(this._controller, this.appbar_title, this.total_price);

  void _onLoading() {
    setState(() {
      _loading = true;
      new Future.delayed(new Duration(seconds: 3), _login);
    });
  }


  Future _login() async{
    setState((){
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(appbar_title)
      ),
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.topCenter,
            child: Column(
            children: <Widget>[
              // 카드 객체들을 하나의 리스트로 전달하면 전달된 카드들이 보여집니다.
              CardList<CardMainContents>([card1, card2]),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "총 결제금액 : ${total_price}원",
                  style: TextStyle(
                    fontSize: 16.0,
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "위 주문 내용을 확인하였으며, 결제에 동의합니다.",
                    style: TextStyle(
                      fontSize: 12.0,
                    )
                ),
              ),
              Container(
                child: ButtonTheme(
                    minWidth: 200.0,
                    height: 40.0,
                    buttonColor: Colors.amber,
                    child: RaisedButton(
                        key: null,
                        onPressed: () => {
                          showOverlayLoading(context),
                          showDialog(
                              context: context,
                              builder: (BuildContext) {
                                return AlertDialog(
                                  title: Text("알림"),
                                  content: Text("결제 되었습니다!\n이용해 주셔서 감사합니다!"),
                                  actions: <Widget>[
                                    FlatButton(
                                        onPressed: () => {
                                          Navigator.pushNamed(context, R.widget.questMap)
                                        },
                                        child: Text("확인")
                                    )
                                  ],
                                );
                              }
                          )
                        },
                        elevation: 4.0,
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.amber,
                        child: Text(
                          "결제",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                          ),
                        )
                    )
                ),
              )
            ],
          )
        ),
      )
    );
  }

  showOverlayLoading(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) =>
            Material(
              child: Container(
                  decoration: new BoxDecoration(
                      color: Color(0xfff2f2f2)
                  ),
                  child: _loading ? ShopPaymentLoading() : null
              ),
            )
    );
    _onLoading();
    overlayState.insert(overlayEntry);
    await Future.delayed(Duration(seconds: 3));
    overlayEntry.remove();
  }
}
