import 'package:flutter/material.dart';
import 'package:questrip/res/common.dart';
import 'package:questrip/widget/about/about_view.dart';
import 'package:questrip/widget/config/config.dart';
import 'package:questrip/widget/config/open_source.dart';
import 'package:questrip/widget/intro/intro.dart';
import 'package:questrip/widget/intro/sign_up.dart';
import 'package:questrip/widget/intro/terms.dart';
import 'package:questrip/widget/leader_board/full_screen.dart';
import 'package:questrip/widget/quest/quest_map.dart';
import 'package:questrip/widget/quest/quest_view.dart';
import 'package:questrip/widget/shop/shop_payment.dart';
import 'package:questrip/widget/shop/shop_payment_select/address.dart';
import 'package:questrip/widget/shop/shop_payment_select/pay_method.dart';

/// 위젯 리소스를 관리합니다.
///
/// 담당자: 이동욱, 구본근, 김호
///
class Widgets extends Resource {

  String get intro => '/intro/intro';
  String get signUp => '/intro/sign/up';
  String get terms => '/intro/terms';

  String get questMap => '/map';
  String get questView => '/map/board';

  String get aboutView => '/about/board';

  String get boardFullScreen => '/board/fullscreen';

  String get config => '/config';
  String get openSource => '/config/terms';

  String get shopPayment => '/shop/payment';
  String get shopSelectAddress => '/shop/select/address';
  String get shopSelectPayMethod => '/shop/select/method';

}

Map<String, WidgetBuilder> makeRoutes(final Widgets w) => {
  w.intro: (BuildContext context) => IntroWidget(),
  w.signUp: (BuildContext context) => SignUpWidget(),
  w.terms: (BuildContext context) => TermsWidget(),
  w.questMap: (BuildContext context) => QuestMapWidget(),
  w.questView: (BuildContext context) => QuestViewWidget(),
  w.aboutView: (BuildContext context) => AboutViewWidget(),
  w.boardFullScreen: (BuildContext context) => FullScreenWidget(),
  w.config: (BuildContext context) => ConfigWidget(),
  w.openSource: (BuildContext context) => OpenSourceWidget(),
  w.shopPayment: (BuildContext context) => ShopPaymentWidget(),
  w.shopSelectAddress: (BuildContext context) => ShopPaymentSelectAddressWidget(),
  w.shopSelectPayMethod: (BuildContext context) => ShopPaymentSelectPayMethodWidget(),
};
