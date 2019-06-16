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

  String get about_field_title => "My quests";
  String get app_name => "Questrip";
  String get common_alert_button_next => "Next";
  String get common_alert_button_prev => "Prev";
  String get common_alert_button_retry => "Retry";
  String get common_alert_button_submit => "Submit";
  String get common_alert_cancel => "Cancel";
  String get common_alert_canceled => "Canceled.";
  String get common_alert_choose_no => "No";
  String get common_alert_choose_yes => "Yes";
  String get common_alert_confirm => "Confirm";
  String get common_alert_field_close_app => "Do you want to close Questrip?";
  String get common_alert_select => "Select";
  String get common_alert_title => "Notice";
  String get common_failure_internal => "Sorry, but try later.";
  String get common_failure_network => "Please check your network status and try again.";
  String get common_failure_unknown => "Unknown Error.";
  String get config_alert_logout => "Are you sure you want to logout?";
  String get config_alert_sign_off => "Are you sure you want to unsubscribe Questrip? You cannot recover an unsubscribed account.";
  String get config_alert_sign_off_success => "Thank you for loving Questrip.\n We look forward to coming back.";
  String get config_button_logout => "Logout";
  String get config_button_open_source => "Open Source Terms";
  String get config_button_sign_off => "Withdrawal";
  String get config_field_title => "Config";
  String get debug_todo => "To be implemented.";
  String get intro_on_failure_canceled => "You should login to use Questrip.";
  String get leader_board_date => "Latest";
  String get leader_board_likes => "Likes";
  String get leader_board_rating => "Rating";
  String get leader_board_report_ads => "Advertising and Promotion";
  String get leader_board_report_etc => "etc";
  String get leader_board_report_irrelevant => "Not relevant";
  String get leader_board_report_papering => "Papering";
  String get leader_board_report_violent => "Violent and sensational";
  String get leader_board_upload_camera => "Camera";
  String get leader_board_upload_gallery => "Gallery";
  String get open_source_terms => "Open Source Terms\n TODO";
  String get permission_camera => "Camera";
  String get permission_denied => "Sorry, but you must accept permissions for using Questrip.";
  String get permission_internet => "Internet";
  String get permission_location => "Location";
  String get quest_map_button_menu => "menu";
  String get shop_about_seller_field_contact => "Contact";
  String get shop_about_seller_field_name_seller => "Seller";
  String get shop_about_seller_field_name_shop => "Name";
  String get shop_about_seller_field_title => "Seller Information";
  String get shop_field_title => "Shop";
  String get shop_payment_button_order => "Order";
  String get shop_payment_field_agree => "I have confirmed the order above and agree to the payment.";
  String get shop_payment_field_loading => "Payment is in progress...\nPlease wait a moment...";
  String get shop_payment_field_ordered => "Payment has been made!\nThank you for using!";
  String get shop_payment_field_title => "Order/Payment";
  String get shop_payment_field_title_address => "Select destination";
  String get shop_payment_field_title_pay_method => "Select payment method";
  String get shop_payment_field_total_price => "Total price";
  String get shop_unit_money => "won";
  String get sign_up_alert_address => "Please check your address.";
  String get sign_up_alert_birthday => "Please check your date of birth.";
  String get sign_up_alert_nickname => "Please check your nickname.";
  String get sign_up_alert_nickname_too_short => "Your nickname should be at least 4 characters long.";
  String get sign_up_field_address => "Address";
  String get sign_up_field_address_detail => "Address (Detail)";
  String get sign_up_field_day => "Day";
  String get sign_up_field_month => "Month";
  String get sign_up_field_nickname => "Nickname";
  String get sign_up_field_welcome => "Welcome!";
  String get sign_up_field_year => "Year";
  String get terms_alert_rejected => "Sorry. Due to internal circumstances, sign-up can not be temporarily done.";
  String get terms_alert_welcome => "Congratulations! All Questrip features are now available.";
  String get terms_button_agree => "I agree to the above terms.";
  String get terms_field_terms => "Terms\nHello world.";
  String get terms_field_title => "Terms";
  String get view_alert_report_duplicate => "Already reported";
  String get view_alert_reported => "Report has been received";
  String get view_alert_submitted => "Submitted!";
  String get view_alert_vote_duplicate => "Already recommended";
  String get view_alert_voted => "Recommended";
  String get view_button_submit => "Submit";
  String get view_field_report => "Report";
  String get view_field_title => "LeaderBoard";
  String quest_map_field_period(String month, String day, String year) => "${month} ${day}, ${year}";
  String shop_about_field_max_value(String max) => "You can purchase up to ${max}.";
  String view_alert_vote(String user) => "Would you recommend it to \"${user}\"?";
}

class $ko_KR extends S {
  const $ko_KR();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get common_alert_choose_no => "아니오";
  @override
  String get shop_payment_field_total_price => "총 결제금액";
  @override
  String get terms_field_terms => "신체 포기 각서\n본인은 Questrip 운영자에게 신체의 모든 지위를 박탈당하는 데에 동의합니다.";
  @override
  String get sign_up_field_address_detail => "상세주소";
  @override
  String get shop_payment_field_ordered => "결제 되었습니다!\n이용해 주셔서 감사합니다!";
  @override
  String get common_alert_title => "알림";
  @override
  String get common_failure_network => "네트워크 연결을 확인하여 다시 시도해주세요.";
  @override
  String get common_alert_field_close_app => "Questrip 을 종료하시겠습니까?";
  @override
  String get leader_board_date => "최신순";
  @override
  String get common_alert_confirm => "확인";
  @override
  String get sign_up_alert_nickname_too_short => "닉네임은 4자 이상이어야 합니다.";
  @override
  String get config_button_logout => "로그아웃";
  @override
  String get common_failure_unknown => "알 수 없는 오류";
  @override
  String get common_failure_internal => "죄송합니다. 잠시 후 다시 시도해주세요.";
  @override
  String get view_button_submit => "도전";
  @override
  String get shop_payment_field_title_address => "배송지 선택";
  @override
  String get leader_board_upload_gallery => "앨범에서 사진 가져오기";
  @override
  String get config_alert_sign_off_success => "그동안 Questrip 을 사랑해주셔서 감사했습니다. \n 다시 돌아오시기를 기다리겠습니다.";
  @override
  String get shop_about_seller_field_contact => "연락처";
  @override
  String get common_alert_button_submit => "제출하기";
  @override
  String get view_alert_report_duplicate => "이미 신고하였습니다";
  @override
  String get leader_board_rating => "추천순";
  @override
  String get view_alert_reported => "신고가 접수되었습니다";
  @override
  String get quest_map_button_menu => "메뉴";
  @override
  String get shop_unit_money => "원";
  @override
  String get permission_denied => "죄송합니다. Questrip 을 사용하기 위해선 권한이 필요합니다.";
  @override
  String get sign_up_field_nickname => "닉네임";
  @override
  String get permission_camera => "사진 촬영";
  @override
  String get common_alert_choose_yes => "예";
  @override
  String get sign_up_alert_address => "주소를 확인해주세요.";
  @override
  String get leader_board_report_etc => "기타";
  @override
  String get intro_on_failure_canceled => "로그인하셔야 앱을 사용하실 수 있습니다.";
  @override
  String get sign_up_field_day => "일";
  @override
  String get common_alert_button_prev => "이전";
  @override
  String get sign_up_field_address => "주소";
  @override
  String get shop_about_seller_field_name_seller => "판매자";
  @override
  String get config_button_open_source => "오픈소스 약관";
  @override
  String get open_source_terms => "오픈소스 약관\n 앱에 사용된 여러 오픈소스들 (Google Maps 등..)의 라이선스를 명시하는 부분입니다.";
  @override
  String get permission_location => "위치 정보";
  @override
  String get terms_alert_welcome => "축하드립니다! 이제 Questrip 의 모든 기능을 이용하실 수 있습니다.";
  @override
  String get common_alert_canceled => "취소하였습니다.";
  @override
  String get common_alert_cancel => "취소";
  @override
  String get leader_board_report_ads => "광고 및 홍보";
  @override
  String get config_alert_logout => "로그아웃 하시겠습니까?";
  @override
  String get shop_payment_button_order => "결제";
  @override
  String get shop_payment_field_loading => "결제 진행중입니다...\n잠시만 기다려주세요...";
  @override
  String get terms_alert_rejected => "죄송합니다. 내부 사정으로 인하여 일시적으로 회원가입을 진행할 수 없습니다.";
  @override
  String get common_alert_select => "선택";
  @override
  String get shop_payment_field_title_pay_method => "결제수단 선택";
  @override
  String get terms_button_agree => "상기 약관에 동의합니다.";
  @override
  String get sign_up_field_year => "년";
  @override
  String get sign_up_alert_nickname => "닉네임을 확인해주세요.";
  @override
  String get terms_field_title => "이용약관";
  @override
  String get view_field_title => "리더보드";
  @override
  String get leader_board_report_papering => "도배";
  @override
  String get shop_payment_field_agree => "위 주문 내용을 확인하였으며, 결제에 동의합니다.";
  @override
  String get shop_about_seller_field_name_shop => "상호명";
  @override
  String get sign_up_field_welcome => "환영합니다!";
  @override
  String get shop_payment_field_title => "주문/결제";
  @override
  String get config_alert_sign_off => "정말 Questrip 을 회원탈퇴 하시겠습니까? 탈퇴한 계정은 복구하실 수 없습니다.";
  @override
  String get debug_todo => "구현 예정입니다.";
  @override
  String get leader_board_report_violent => "폭력적 및 선정적";
  @override
  String get view_alert_vote_duplicate => "이미 추천하였습니다";
  @override
  String get view_alert_voted => "추천하였습니다";
  @override
  String get shop_about_seller_field_title => "판매자 정보";
  @override
  String get config_button_sign_off => "회원탈퇴";
  @override
  String get sign_up_alert_birthday => "생년월일을 확인해주세요.";
  @override
  String get app_name => "Questrip";
  @override
  String get sign_up_field_month => "월";
  @override
  String get view_alert_submitted => "제출되었습니다!";
  @override
  String get config_field_title => "환경설정";
  @override
  String get leader_board_report_irrelevant => "관련없음";
  @override
  String get common_alert_button_retry => "재선택";
  @override
  String get leader_board_upload_camera => "카메라로 사진촬영";
  @override
  String get leader_board_likes => "Likes";
  @override
  String get shop_field_title => "상점";
  @override
  String get view_field_report => "신고하기";
  @override
  String get about_field_title => "내가 도전한 퀘스트";
  @override
  String get permission_internet => "인터넷";
  @override
  String get common_alert_button_next => "다음";
  @override
  String shop_about_field_max_value(String max) => "최대 ${max}개까지 구매할 수 있습니다.";
  @override
  String quest_map_field_period(String year, String month, String day) => "${year}년 ${month}월 ${day}일까지";
  @override
  String view_alert_vote(String user) => "\"${user}\"님의 작품에 추천하시겠습니까?";
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
