import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:questrip/data/quest.dart';
import 'package:questrip/lib.dart';

/// 마커를 생성합니다.
///
/// 담당자: 김호, 이동욱
///
class QuestMapMarker {

  /// 퀘스트 정보를 토대로 마커를 생성합니다.
  static Marker fromQuest(final Quest quest, final Runnable onTap) {
    final String markerIdVal = quest.title;
    final MarkerId markerId = MarkerId(markerIdVal);
    return Marker(
      markerId: markerId,
      position: quest.latLng,
      icon: getMarkerIcon(quest),
      infoWindow: InfoWindow(title: markerIdVal),
      onTap: onTap,
    );
  }

  /// 마커에 아이콘을 부여합니다.
  static BitmapDescriptor getMarkerIcon(final Quest quest) {
    // TODO to be implemented.
    return null;
  }

}
