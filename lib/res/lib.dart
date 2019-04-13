import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:questrip/data/account.dart';
import 'package:questrip/generated/i18n.dart';
import 'package:questrip/net/uri.dart';
import 'package:questrip/res/drawable.dart';
import 'package:questrip/res/widgets.dart';

/// 리소스 자원을 한곳에서 관리합니다.
///
/// 담당자: 김호
///
class R {

  static Account  _account;
  static Drawable _drawable;
  static Location _location;
  static S        _string;
  static URI      _uri;
  static Widgets  _widget;

  static Account  get account   => _account;
  static Drawable get drawable  => _drawable;
  static Location get location  => _location;
  static S        get string    => _string;
  static URI      get uri       => _uri;
  static Widgets  get widget    => _widget;

  /// 사용자 정보, 문자열 외 모든 리소스 자원을 초기화합니다.
  static void init() {
    _drawable = Drawable();
    _widget = Widgets();
    _location = Location();
    _uri = URI();
  }

  /// 사용자 정보를 초기화합니다.
  static void initAccount(final Account account) async {
    _account = account;
  }

  /// 문자열 자원을 초기화합니다.
  static void initString(BuildContext context) async {
    // _string = await S.delegate.load(Localizations.localeOf(context));
    _string = await S.delegate.load(Locale('ko', 'KR'));
  }

  /// 권한을 요청합니다.
  static Future<bool> requestPermission() async {
    return _location.requestPermission();
  }

}
