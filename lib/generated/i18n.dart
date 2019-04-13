import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
class S implements WidgetsLocalizations {
  const S();

  static const GeneratedLocalizationsDelegate delegate =
    GeneratedLocalizationsDelegate();

  static S of(BuildContext context) => Localizations.of<S>(context, S);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get app_name => "Questrip";
  String get common_alert_button_next => "Next";
  String get common_alert_button_prev => "Prev";
  String get common_alert_button_submit => "Submit";
  String get common_alert_cancel => "Cancel";
  String get common_alert_canceled => "Canceled.";
  String get common_alert_choose_no => "No";
  String get common_alert_choose_yes => "Yes";
  String get common_alert_confirm => "Confirm";
  String get common_alert_field_close_app => "Do you want to close Questrip?";
  String get common_alert_title => "Notice";
  String get common_failure_internal => "Sorry, but try later.";
  String get common_failure_network => "Please check your network status and try again.";
  String get common_failure_unknown => "Unknown Error.";
  String get debug_todo => "To be implemented.";
  String get intro_on_failure_canceled => "You should login to use Questrip.";
}

class $ko_KR extends S {
  const $ko_KR();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get common_alert_choose_no => "아니오";
  @override
  String get common_alert_title => "알림";
  @override
  String get common_failure_network => "네트워크 연결을 확인하여 다시 시도해주세요.";
  @override
  String get common_alert_field_close_app => "Questrip 을 종료하시겠습니까?";
  @override
  String get common_alert_confirm => "확인";
  @override
  String get common_failure_unknown => "알 수 없는 오류";
  @override
  String get common_failure_internal => "죄송합니다. 잠시 후 다시 시도해주세요.";
  @override
  String get common_alert_button_submit => "제출하기";
  @override
  String get common_alert_choose_yes => "예";
  @override
  String get intro_on_failure_canceled => "로그인하셔야 앱을 사용하실 수 있습니다.";
  @override
  String get common_alert_button_prev => "이전";
  @override
  String get common_alert_canceled => "취소하였습니다.";
  @override
  String get common_alert_cancel => "취소";
  @override
  String get debug_todo => "구현 예정입니다.";
  @override
  String get app_name => "Questrip";
  @override
  String get common_alert_button_next => "다음";
}

class $en extends S {
  const $en();
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("ko", "KR"),
      Locale("en", ""),
    ];
  }

  LocaleListResolutionCallback listResolution({Locale fallback, bool withCountry = true}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported, withCountry);
      }
    };
  }

  LocaleResolutionCallback resolution({Locale fallback, bool withCountry = true}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported, withCountry);
    };
  }

  @override
  Future<S> load(Locale locale) {
    final String lang = getLang(locale);
    if (lang != null) {
      switch (lang) {
        case "ko_KR":
          return SynchronousFuture<S>(const $ko_KR());
        case "en":
          return SynchronousFuture<S>(const $en());
        default:
          // NO-OP.
      }
    }
    return SynchronousFuture<S>(const S());
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale, true);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;

  ///
  /// Internal method to resolve a locale from a list of locales.
  ///
  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported, bool withCountry) {
    if (locale == null || !_isSupported(locale, withCountry)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  ///
  /// Returns true if the specified locale is supported, false otherwise.
  ///
  bool _isSupported(Locale locale, bool withCountry) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        // Language must always match both locales.
        if (supportedLocale.languageCode != locale.languageCode) {
          continue;
        }

        // If country code matches, return this locale.
        if (supportedLocale.countryCode == locale.countryCode) {
          return true;
        }

        // If no country requirement is requested, check if this locale has no country.
        if (true != withCountry && (supportedLocale.countryCode == null || supportedLocale.countryCode.isEmpty)) {
          return true;
        }
      }
    }
    return false;
  }
}

String getLang(Locale l) => l == null
  ? null
  : l.countryCode != null && l.countryCode.isEmpty
    ? l.languageCode
    : l.toString();