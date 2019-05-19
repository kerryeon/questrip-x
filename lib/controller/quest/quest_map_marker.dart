import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:questrip/data/quest.dart';
import 'package:questrip/data/shop.dart';

/// 마커를 생성합니다.
///
/// 담당자: 김호, 이동욱
///
class QuestMapMarker {

  /// 퀘스트 정보를 토대로 마커를 생성합니다.
  static Marker fromQuest(final Quest quest, final void Function(Quest) onTap) {
    final String markerIdVal = quest.title;
    final MarkerId markerId = MarkerId(markerIdVal);
    return Marker(
      markerId: markerId,
      position: quest.latLng,
      icon: _getMarkerIconFromQuest(quest),
      infoWindow: InfoWindow(title: markerIdVal),
      onTap: () => onTap(quest),
    );
  }

  /// 상점 정보를 토대로 마커를 생성합니다.
  static Marker fromShop(final Shop shop, final void Function(Shop) onTap) {
    final String markerIdVal = shop.name;
    final MarkerId markerId = MarkerId(markerIdVal);
    return Marker(
      markerId: markerId,
      position: shop.latLng,
      icon: _getMarkerIconFromShop(shop),
      infoWindow: InfoWindow(title: markerIdVal),
      onTap: () => onTap(shop),
    );
  }

  /// 퀘스트 정보를 토대로 마커에 아이콘을 부여합니다.
  static BitmapDescriptor _getMarkerIconFromQuest(final Quest quest) {
    // TODO to be implemented.
    return null;
  }

  /// 상점 정보를 토대로 마커에 아이콘을 부여합니다.
  static BitmapDescriptor _getMarkerIconFromShop(final Shop shop) {
    // TODO to be implemented.
    return null;
  }

}
