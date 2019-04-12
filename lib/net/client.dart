import 'dart:convert';
import 'dart:io';

import 'package:questrip/lib.dart';
import 'package:questrip/net/lib.dart';
import 'package:questrip/net/login/lib.dart';

/// 서버에 데이터를 요청합니다.
void request(String uri, void onSuccess(Map<String, Object> response),
    OnFailure onFailure, { Map<String, Object> data }) async {
  // 요청을 준비합니다.
  final HttpClient httpClient = new HttpClient();
  httpClient.postUrl(Uri.parse(_composeURI(uri))).then((request) async {
    // 헤더를 추가합니다.
    request.headers.set('content-type', 'application/json');
    // 데이터를 싣습니다.
    data ??= {};
    data['token'] = await getAccessToken();
    request.add(utf8.encode(json.encode(data)));
    // 데이터를 수신하고 요청을 종료합니다.
    final HttpClientResponse response = await request.close();
    httpClient.close();
    // 결과를 해석합니다.
    switch (response.statusCode) {
      case HttpStatus.ok:
        onSuccess(json.decode(await response.transform(utf8.decoder).join()));
        break;
      default:
        onFailure(Failed.INTERNAL);
        break;
    }
    // 네트워크 연결이 좋지 않은 경우의 이벤트를 호출합니다.
  }).catchError((e) {
    print(e);
    onFailure(Failed.NETWORK_FAILURE);
  });
}

/// 서버에 사용자 행위를 요청합니다.
void requestAccept(String uri, Runnable onSuccess, OnFailure onFailure, {
  Map<String, Object> data, final String key: 'accept'
}) async {
  request(uri, (r) => r[key]
      ? onSuccess()
      : onFailure(Failed.REJECTED), onFailure);
}

/// 요청 경로를 생성합니다.
String _composeURI(final String uri) {
  return '$PROTOCOL://$HOST:$PORT$uri';
}
