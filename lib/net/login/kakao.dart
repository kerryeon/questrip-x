import 'package:flutter_kakao_login/flutter_kakao_login.dart';
import 'package:questrip/net/lib.dart';
import 'package:questrip/net/login/lib.dart';

/// Facebook Login API 에 로그인을 시도합니다.
/// 
/// 담당자: 김호
class KakaoLoginManager extends ILoginManager {

  FlutterKakaoLogin api;

  KakaoLoginManager() {
    api = FlutterKakaoLogin();
  }

  /// 로그인을 시도합니다.
  @override
  void tryLogin(final OnSuccess onSuccess,
      final OnFailure onFailure) async {
    // 이미 로그인하였다면, 다시 로그인하지 않습니다.
    if (await isLoggedIn) {
      onSuccess(await accessToken);
      return;
    }
    final result = await api.logIn();

    switch (result.status) {
      case KakaoLoginStatus.loggedIn:
        onSuccess(await accessToken);
        break;
      case KakaoLoginStatus.loggedOut:
      case KakaoLoginStatus.error:
        onFailure(Failed.NETWORK_FAILURE);
        break;
    }
  }

  /// 이미 로그인돼있는지 검사합니다.
  @override
  Future<bool> get isLoggedIn => api.isLoggedIn;

  /// 엑세스 토큰을 가져옵니다.
  @override
  Future<String> get accessToken async => (await api.currentAccessToken).token;

  /// 로그인 API 명칭을 반환합니다.
  @override
  String get apiName => 'kakao';

}
