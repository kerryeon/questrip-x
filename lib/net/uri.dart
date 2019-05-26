/// 서버의 URI 자원을 관리합니다.
///
/// 담당자: 김호
class URI {

  // intro
  String get signIn => '/sign/in';
  String get signUp => "/sign/up";
  String get signOff => "/sign/off";

  // explore
  String get meQuest => "/me/quest";

  // view leader_board
  String get meView => "/me/view";
  String get meSubmit => "/me/submit";
  String get meReport => "/me/report";
  String get meVote => "/me/vote";

  // about leader_board
  String get meBoard => "/me/board";

  // seller
  String get sellerAbout => "/seller/about";

  // shop
  String get shopList => "/shop/list";
  String get shopView => "/shop/view";

  // External
  String get address => _root + "/address.html";
  String get pathImage => _root + "/u/img/";

  // Root
  String get _root => "http://203.255.3.181:9494";

}
