import 'package:meta/meta.dart';

/// 사용자 정보를 담고 있는 클래스입니다.
///
/// 담당자: 김호
///
class Account {

  final String nickname;
  final int birthday;
  final String address;
  final String addressDetail;

  const Account({
    @required this.nickname,
    @required this.birthday,
    @required this.address,
    @required this.addressDetail,
  })  : assert(nickname != null),
        assert(birthday != null),
        assert(address != null),
        assert(addressDetail != null);

  /// 서버로부터 전송받은 JSON 데이터를 해독합니다.
  static Account fromJSON(Map<String, Object> response) => Account(
      nickname: response['nickname'],
      birthday: response['birthday'],
      address: response['address'],
      addressDetail: response['address_detail'],
  );

}
