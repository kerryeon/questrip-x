import 'package:questrip/data/account.dart';
import 'package:questrip/lib.dart';
import 'package:questrip/net/client.dart';
import 'package:questrip/net/lib.dart';
import 'package:questrip/net/login/facebook.dart';
import 'package:questrip/res/lib.dart';

typedef OnSuccess = void Function(String token);

/// 로그인 프로세스를 추상화한 클래스입니다.
/// 
/// 담당자: 김호
abstract class ILoginManager {

  static ILoginManager _instance;

  /// 로그인을 시도합니다.
  void tryLogin(final OnSuccess onSuccess,
      final OnFailure onFailure);

  /// 로그아웃합니다.
  void logOut();

  /// 이미 로그인돼있는지 검사합니다.
  Future<bool> get isLoggedIn;

  /// 엑세스 토큰을 가져옵니다.
  Future<String> get accessToken;

  /// 로그인 API 명칭을 반환합니다.
  String get apiName;

}

/// 로그인 프로세스를 수행합니다.
void tryLogin(Runnable onSuccess, OnFailure onFailure, Runnable onNewUser) {
  ILoginManager._instance = FacebookLoginManager();
  ILoginManager._instance.tryLogin(
      (token) => _onSuccess(token, onSuccess, onFailure, onNewUser), onFailure);
}

/// 로그아웃합니다.
void logOut() => ILoginManager._instance.logOut();

/// 사용자의 엑세스 토큰을 반환합니다.
Future<String> getAccessToken() => ILoginManager._instance.accessToken;

/// 로그인 API 명칭을 반환합니다.
String get getApiName => ILoginManager._instance.apiName;

/// API 로그인에 성공한 경우의 이벤트입니다.
/// 서버에도 로그인을 시도합니다.
void _onSuccess(String token, Runnable onSuccess, OnFailure onFailure, Runnable onNewUser) =>
    request(R.uri.signIn,
            (r) => _onReceived(r, onSuccess, onFailure, onNewUser), onFailure,
        data: {'api': getApiName});

/// 서버로부터 로그인 결과를 수신한 경우의 이벤트입니다.
void _onReceived(Map<String, Object> response, Runnable onSuccess,
    OnFailure onFailure, Runnable onNewUser) {
  // 결과에 맞는 이벤트를 호출합니다.
  if (response['sign_in']) {
    // 사용자 정보를 저장합니다.
    final Account account = Account.fromJSON(response['data']);
    R.initAccount(account);
    onSuccess();
  }
  else if (response['sign_up']) onNewUser();
  else onFailure(Failed.INTERNAL);
}
