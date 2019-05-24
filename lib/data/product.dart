import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

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

  int count = 0;

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

  /// 가격을 원화로, 단위를 구별하여 문자열로 반환합니다.
  /// TODO to be implemented.
  String get priceWon => NumberFormat('#,###').format(price).toString();

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
