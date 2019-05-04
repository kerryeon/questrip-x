import 'package:questrip/controller/lib.dart';
import 'package:questrip/lib.dart';
import 'package:questrip/net/client.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

/// 환경설정 화면의 동작을 담당합니다.
///
/// 담당자: 김호, 이동욱
///
class ConfigController extends IController {

  /// 사용자가 로그아웃 버튼을 누른 경우의 이벤트입니다.
  /// 다시 물어본 후, 로그아웃합니다.
  void logout() => dialog(context, R.string.config_alert_logout,
      onConfirm: () {
          // TODO to be implemented.
      },
      onCancel: () {},
  );

  /// 사용자가 회원탈퇴 버튼을 누른 경우의 이벤트입니다.
  /// 진중히 다시 물어본 후, 회원탈퇴를 요청합니다.
  void signOff() => dialog(context, R.string.config_alert_sign_off,
    onConfirm: () => requestAccept(R.uri.signOff,
        // 회원탈퇴에 성공한 경우.
            () => dialog(context, R.string.config_alert_sign_off_success,
                onConfirm: exit),
        // 회원탈퇴에 실패한 경우.
            (f) => dialogFailed(context, f)),
    onCancel: () {},
  );

  /// 사용자가 오픈소스 약관 버튼을 누른 경우의 이벤트입니다.
  /// 오픈소스 약관 화면으로 이동합니다.
  void showOpenSource() {
    // TODO to be implemented.
    print('hello');
  }

}
