import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:questrip/data/marker.dart';
import 'package:questrip/res/lib.dart';

/// 상점에 대한 정보를 담고 있는 클래스입니다.
///
/// 담당자: 김호
///
class Shop with IMarker {

  final int id;
  final String name;
  final String description;
  final int sellerId;
  final String location;
  final double latitude;
  final double longitude;
  final int sector;
  final int rank;

  Shop({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.sellerId,
    @required this.location,
    @required this.latitude,
    @required this.longitude,
    @required this.sector,
    @required this.rank,
  })  : assert(id != null),
        assert(name != null),
        assert(description != null),
        assert(sellerId != null),
        assert(location != null),
        assert(latitude != null),
        assert(longitude != null),
        assert(sector != null),
        assert(rank != null);

  /// 서버로부터 전송받은 JSON 데이터를 해독합니다.
  static Shop fromJSON(Map<String, Object> response) => Shop(
    id: response['_id'],
    name: response['name'],
    description: response['description'],
    sellerId: response['seller'],
    location: response['location'],
    latitude: response['latitude'],
    longitude: response['longitude'],
    sector: response['sector'],
    rank: response['rank'],
  );

  /// 위경도 정보를 반환합니다.
  LatLng get latLng => LatLng(latitude, longitude);

  /// 마커의 제목을 반환합니다.
  @override
  String get markerName => this.name;

  /// 마커에 아이콘을 부여합니다.
  @override
  String get markerIcon => R.drawable.routeMarkerShop(sector);

  /// [a]와 [b]의 판매자 등급을 비교합니다.
  /// [b]가 등급이 더 높다면 +를 반환합니다.
  static int compareRank(Shop a, Shop b) => b.rank - a.rank;

}
