import 'package:meta/meta.dart';

/// 판매자 정보를 담고 있는 클래스입니다.
///
/// 담당자: 김호
///
class Seller {

  final int id;

  final String name;
  final int phone;
  final int rank;

  const Seller({
    @required this.id,
    @required this.name,
    @required this.phone,
    @required this.rank,
  })  : assert(id != null),
        assert(name != null),
        assert(phone != null),
        assert(rank != null);

  /// 서버로부터 전송받은 JSON 데이터를 해독합니다.
  static Seller fromJSON(Map<String, Object> response) => Seller(
    id: response['_id'],
    name: response['name'],
    phone: response['phone'],
    rank: response['rank'],
  );

  /// 전화번호를 한국식 표기법으로 변환합니다.
  String get cPhoneKorean {
    final String cPhone = phone.toString();
    switch (cPhone.length) {
      case  8: return _cPhoneFormat(cPhone, [4, 8,   ], '0');
      case  9: return _cPhoneFormat(cPhone, [2, 5,  9], '0');
      case 10: return _cPhoneFormat(cPhone, [2, 6, 10], '0');
      default: return '0' + phone.toString();
    }
  }

  /// 전화번호를 지정한 표기법으로 변환합니다.
  String _cPhoneFormat(String phone, List<int> offsets, [String start]) =>
      start + offsets
          .asMap()
          .map(
              (idx, offset) => MapEntry(idx, phone
                  .substring(idx > 0 ? offsets[idx-1] : 0, offset)
              ))
          .values
          .reduce((a, b) => a + '-' + b);

}
