import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:questrip/net/lib.dart';
import 'package:questrip/net/login/lib.dart';

/// Facebook Login API 에 로그인을 시도합니다.
/// 
/// 담당자: 김호
class FacebookLoginManager extends ILoginManager {

  FacebookLogin api;

  FacebookLoginManager() {
    api = FacebookLogin();
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
    final result = await api.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        onSuccess(await accessToken);
        break;
      case FacebookLoginStatus.cancelledByUser:
        onFailure(Failed.USER_CANCELED);
        break;
      case FacebookLoginStatus.error:
        onFailure(Failed.NETWORK_FAILURE);
        break;
    }
  }

  /// 로그아웃합니다.
  void logOut() async => await api.logOut();

  /// 이미 로그인돼있는지 검사합니다.
  @override
  Future<bool> get isLoggedIn => api.isLoggedIn;

  /// 엑세스 토큰을 가져옵니다.
  @override
  Future<String> get accessToken async => (await api.currentAccessToken).token;

  /// 로그인 API 명칭을 반환합니다.
  @override
  String get apiName => 'facebook';

}
