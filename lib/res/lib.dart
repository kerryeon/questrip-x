import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:questrip/generated/i18n.dart';
import 'package:questrip/net/uri.dart';
import 'package:questrip/res/drawable.dart';
import 'package:questrip/res/widgets.dart';

/// 리소스 자원을 한곳에서 관리합니다.
///
/// 담당자: 김호
///
class R {

  static S _string;
  static Drawable _drawable;
  static Widgets _widget;
  static URI _uri;

  static Location _location;

  static S get string => _string;
  static Drawable get drawable => _drawable;
  static Widgets get widget => _widget;
  static Location get location => _location;
  static URI get uri => _uri;

  /// 문자열 외 모든 리소스 자원을 초기화합니다.
  static void init() {
    _drawable = Drawable();
    _widget = Widgets();
    _location = Location();
    _uri = URI();
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
