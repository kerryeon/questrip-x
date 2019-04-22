import 'package:flutter_inappbrowser/flutter_inappbrowser.dart';
import 'package:questrip/controller/lib.dart';
import 'package:questrip/lib.dart';

/// 주소 불러오기 화면의 동작을 담당합니다.
/// 사용자의 집주소를 API 를 통해 불러옵니다.
///
/// 담당자: 정홍기, 김호
///
class AddressController extends IController {

  final _AddressWebView _browser = new _AddressWebView();

  /// 사용자의 집주소를 불러옵니다.
  void getAddress(void Function(String) onSuccess, Runnable onFailure) async {
    _browser.isCleared = false;
    _browser.onSuccess = onSuccess;
    _browser.onFailure = onFailure;
    _browser.open(
        url: "http://203.255.3.181:9494/address.html",
        // url: "http://naver.com/",
        options: {
          "allowsLinkPreview": false,
          "hideUrlBar": true,
          "javaScriptCanOpenWindowsAutomatically": true,
          "toolbarBottom": false,
          "useShouldOverrideUrlLoading": true,
          "useOnLoadResource": true,
        });
  }

}

/// 주소 불러오기 동작의 API 인터페이스를 구축합니다.
///
/// 담당자: 정홍기, 김호
///
class _AddressWebView extends InAppBrowser {

  void Function(String) onSuccess;
  Runnable onFailure;
  bool isCleared = true;

  /// 사용자가 집주소를 고르지 않고 나갔을 경우, 이에 맞는 이벤트를 호출합니다.
  @override
  void onExit() {
    if (! isCleared) {
      isCleared = true;
      onFailure();
    }
  }

  /// 사용자가 집주소를 고른 경우, 이에 맞는 이벤트를 호출합니다.
  @override
  void onLoadResource(WebResourceResponse response, WebResourceRequest request) {
    final result = Uri.parse(response.url).queryParameters;
    if (! result.containsKey('sq') || result['sq'].length < 4) return;
    final addressQuery = Uri.decodeComponent(result['sq']);
    final address = addressQuery.split('|')[2];
    isCleared = true;
    close();
    onSuccess(address);
  }

  @override
  void shouldOverrideUrlLoading(String url) => this.webViewController.loadUrl(url);

}
