import 'package:flutter/material.dart';
import 'package:questrip/controller/quest/quest_map/interface.dart';
import 'package:questrip/data/shop.dart';
import 'package:questrip/net/client.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/widget/common/alert.dart';

mixin IQuestMapShopsController on IQuestMapController {

  /// 상점 목록입니다.
  List<Shop> shops;

  /// 상점 목록을 불러옵니다.
  /// 만약 실패하면, 그 이유를 알려줍니다.
  @protected
  void tryLoadShops() async => request(
      R.uri.shopList, _onLoadQuests,
          (e) => dialogFailed(context, e)
  );

  /// 상점 목록을 성공적으로 불러온 경우의 이벤트입니다.
  void _onLoadQuests(final Map<String, Object> response) async {
    final List<Object> raw = response['list'];
    shops = raw.map((q) => Shop.fromJSON(q)).toList();
    shops.sort(Shop.compareRank);
  }

  /// 상점 목록 보기 모드면 true 를 반환합니다.
  @protected
  bool isModeShops() => markersData == shops;

  /// 상점 목록 보기 모드로 전환합니다.
  @protected
  void showShops() => markersData = shops;

}
