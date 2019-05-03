import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

/// 퀘스트에 대한 자세한 정보를 담고 있는 클래스입니다.
///
/// 담당자: 김호
///
class Quest {

  final int id;
  final String title;
  final String description;
  final String location;
  final double latitude;
  final double longitude;
  final int dateBegin;
  final int dateEnd;
  final int rating;
  final bool isCleared;

  const Quest({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.location,
    @required this.latitude,
    @required this.longitude,
    @required this.dateBegin,
    @required this.dateEnd,
    @required this.rating,
    @required this.isCleared,
  })  : assert(id != null),
        assert(title != null),
        assert(description != null),
        assert(location != null),
        assert(latitude != null),
        assert(longitude != null),
        assert(dateBegin != null),
        assert(dateEnd != null),
        assert(rating != null),
        assert(isCleared != null);

  /// 서버로부터 전송받은 JSON 데이터를 해독합니다.
  static Quest fromJSON(Map<String, Object> response) => Quest(
      id: response['_id'],
      title: response['title'],
      description: response['description'],
      location: response['location'],
      latitude: response['latitude'],
      longitude: response['longitude'],
      dateBegin: response['date_begin'],
      dateEnd: response['date_end'],
      rating: response['rating'],
      isCleared: response['is_cleared'],
  );

  /// 위경도 정보를 반환합니다.
  LatLng get latLng => LatLng(latitude, longitude);

  /// [a]와 [b]의 인기도를 비교합니다.
  /// [b]가 더 인기있으면 +를 반환합니다.
  static int compareRating(Quest a, Quest b) => b.rating - a.rating;

}
