import 'package:meta/meta.dart';
import 'package:questrip/controller/lib.dart';

/// 상점 물품에 대한 자세한 정보를 담고 있는 클래스입니다.
///
/// 담당자: 김호
///
class Product {

  final int id;
  final String name;
  final String description;
  final String unit;
  final int price;
  final String imagePath;

  /// 최대 구매가능 수량
  static const int COUNT_MAX = 9;

  int count = 0;

  /// 금액과 수량의 곱인 소계를 반환합니다.
  int get totalPrice => count * price;

  /// 가격을 원화로, 단위를 구별하여 문자열로 반환합니다.
  String get cPrice => formatPrice(price);

  /// 총액을 원화로, 단위를 구별하여 문자열로 반환합니다.
  String get cTotalPrice => formatPrice(totalPrice);

  Product({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.unit,
    @required this.price,
    @required this.imagePath,
  })  : assert(id != null),
        assert(name != null),
        assert(description != null),
        assert(unit != null),
        assert(price != null),
        assert(imagePath != null);

  /// 서버로부터 전송받은 JSON 데이터를 해독합니다.
  static Product fromJSON(Map<String, Object> response) => Product(
    id: response['_id'],
    name: response['name'],
    description: response['description'],
    unit: response['unit'],
    price: response['price'],
    imagePath: response['image'],
  );

  /// [a]와 [b]의 가격을 비교합니다.
  /// [b]가 더 비싸다면 +를 반환합니다.
  static int comparePrice(Product a, Product b) => b.price - a.price;

}
