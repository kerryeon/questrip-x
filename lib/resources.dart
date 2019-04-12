import 'package:flutter/material.dart';
import 'package:questrip/generated/i18n.dart';

/// 리소스 자원을 한곳에서 관리합니다.
///
/// 담당자: 김호
///

class R {

  static S _string;
  static _Drawable _drawable;

  static S get string => _string;
  static _Drawable get drawable => _drawable;

  static init(BuildContext context) async {
    // _string = await S.delegate.load(Localizations.localeOf(context));
    _string = await S.delegate.load(Locale('ko', 'KR'));
    _drawable = _Drawable();
  }

}

/// 이미지 리소스를 관리합니다.
class _Drawable extends _Resource {

  String get logo => _routeSVG('logo');

  @override
  String _route(final String route) => 'res/drawable/' + route;
  String _routeSVG(final String route) => _route(route + '.svg');

}

/// 리소스를 추상화한 클래스입니다.
abstract class _Resource {
  String _route(final String route);
}
