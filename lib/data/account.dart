import 'package:meta/meta.dart';
import 'package:questrip/controller/lib.dart';

/// 사용자 정보를 담고 있는 클래스입니다.
///
/// 담당자: 김호
///
class Account {

  final String nickname;
  final int birthday;
  final String address;
  final String addressDetail;
  final int savings;

  /// 포인트를 원화로, 단위를 구별하여 문자열로 반환합니다.
  String get cSavings => formatPrice(savings);

  const Account({
    @required this.nickname,
    @required this.birthday,
    @required this.address,
    @required this.addressDetail,
    @required this.savings,
  })  : assert(nickname != null),
        assert(birthday != null),
        assert(address != null),
        assert(addressDetail != null),
        assert(savings != null);

  /// 서버로부터 전송받은 JSON 데이터를 해독합니다.
  static Account fromJSON(Map<String, Object> response) => Account(
    nickname: response['nickname'],
    birthday: response['birthday'],
    address: response['address'],
    addressDetail: response['address_detail'],
    savings: response['savings'],
  );

  /// 서버로 전송 가능한 JSON 형식의 데이터를 반환합니다.
  Map<String, Object> toJSON() => {
    'nickname': nickname,
    'birthday': birthday,
    'address': address,
    'address_detail': addressDetail,
  };

}
