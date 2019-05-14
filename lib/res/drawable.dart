import 'package:questrip/res/common.dart';

/// 이미지 리소스를 관리합니다.
/// 
/// 담당자: 이동욱, 구본근, 김호
///
class Drawable extends Resource {

  String get logo => _routeSVG('logo');
  String get bug => _routeSVG('bug');
  String get plane => _routeSVG('black-plane');
  String get like => _routeSVG('like');

  String get marker => _routeSVG('marker');
  String get trophy => _routeSVG('trophy');

  String _route(final String route) => 'res/drawable/' + route;
  String _routeSVG(final String route) => _route(route + '.svg');

}
