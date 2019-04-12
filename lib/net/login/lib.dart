import 'package:questrip/lib.dart';
import 'package:questrip/net/client.dart';
import 'package:questrip/net/lib.dart';
import 'package:questrip/net/login/facebook.dart';
import 'package:questrip/net/login/path.dart';

typedef OnSuccess = void Function(String token);

/// 로그인 프로세스를 추상화한 클래스입니다.
/// 
/// 담당자: 김호
abstract class ILoginManager {

  static ILoginManager _instance;

  /// 로그인을 시도합니다.
  void tryLogin(final OnSuccess onSuccess,
      final OnFailure onFailure);

  /// 이미 로그인돼있는지 검사합니다.
  Future<bool> get isLoggedIn;

  /// 엑세스 토큰을 가져옵니다.
  Future<String> get accessToken;

}

/// 로그인 프로세스를 수행합니다.
void tryLogin(Runnable onSuccess, OnFailure onFailure, Runnable onNewUser) {
  ILoginManager._instance = FacebookLoginManager();
  ILoginManager._instance.tryLogin(
      (token) => _onSuccess(token, onSuccess, onFailure, onNewUser), onFailure);
}

/// 사용자의 엑세스 토큰을 반환합니다.
Future<String> getAccessToken() => ILoginManager._instance.accessToken;

/// API 로그인에 성공한 경우의 이벤트입니다.
/// 서버에도 로그인을 시도합니다.
void _onSuccess(String token, Runnable onSuccess, OnFailure onFailure, Runnable onNewUser)
=> request(SIGN_IN, (r) => _onReceived(r, onSuccess, onFailure, onNewUser), onFailure);

/// 서버로부터 로그인 결과를 수신한 경우의 이벤트입니다.
void _onReceived(Map<String, Object> response, Runnable onSuccess,
    OnFailure onFailure, Runnable onNewUser) {
  if (response['sign_in']) onSuccess();
  else if (response['sign_up']) onNewUser();
  else onFailure(Failed.INTERNAL);
}
