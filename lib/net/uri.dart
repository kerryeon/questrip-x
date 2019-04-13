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

  // images
  String get pathImage => "/u/img/";

}