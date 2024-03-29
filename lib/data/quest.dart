import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:questrip/data/marker.dart';
import 'package:questrip/res/lib.dart';

/// 퀘스트에 대한 자세한 정보를 담고 있는 클래스입니다.
///
/// 담당자: 김호
///
class Quest with IMarker {

  final int id;
  final String title;
  final String description;
  final String location;
  final double latitude;
  final double longitude;
  final int dateBegin;
  final int dateEnd;
  final int sector;
  final int reward;
  final int rating;
  final bool isCleared;

  Quest({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.location,
    @required this.latitude,
    @required this.longitude,
    @required this.dateBegin,
    @required this.dateEnd,
    @required this.sector,
    @required this.reward,
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
        assert(sector != null),
        assert(reward != null),
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
    sector: response['sector'],
    reward: response['reward'],
    rating: response['rating'],
    isCleared: response['is_cleared'],
  );

  /// 위경도 정보를 반환합니다.
  @override
  LatLng get latLng => LatLng(latitude, longitude);

  /// 마커의 제목을 반환합니다.
  @override
  String get markerName => this.title;

  /// 마커에 아이콘을 부여합니다.
  @override
  String get markerIcon => R.drawable.routeMarkerQuest(sector);

  /// [a]와 [b]의 인기도를 비교합니다.
  /// [b]가 더 인기있으면 +를 반환합니다.
  static int compareRating(Quest a, Quest b) => b.rating - a.rating;

}
