import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

mixin IMarker {

  /// 위경도 정보를 반환합니다.
  LatLng get latLng;

  /// 마커의 제목을 반환합니다.
  String get markerName;

  /// 마커에 아이콘을 부여합니다.
  @protected
  String get markerIcon;

  /// 마커를 생성합니다.
  Future<Marker> toMarker(final void Function(IMarker) onTap) async {
    final String markerIdVal = this.markerName;
    final MarkerId markerId = MarkerId(markerIdVal);
    final String cMarkerIcon = markerIcon;
    return Marker(
      markerId: markerId,
      position: this.latLng,
      icon: cMarkerIcon != null
          ? await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(
          // FIXME Not working?
          size: const Size(32.0, 32.0),
        ),
        markerIcon,
      ) : BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title: markerIdVal),
      onTap: () => onTap(this),
    );
  }

}
