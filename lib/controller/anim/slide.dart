import 'package:flutter/material.dart';
import 'package:questrip/controller/lib.dart';

/// 레이아웃의 미끄러운 등장/퇴장 효과를 담당하는 추가 기능입니다.
///
/// 담당자: 김호, 정홍기
///
mixin SlideAnimation on IController {

  /// 레이아웃의 위치값을 담고 있습니다.
  Animation<Offset> offset;

  /// 레이아웃이 보이는 지 알려줍니다.
  bool get visible => _visible;

  AnimationController _animationController;
  bool _visible;

  /// 애니메이션 동작 속도를 정의합니다.
  static const int _durationMs = 150;

  /// 애니메이션을 초기화합니다.
  void initAnimation(TickerProvider provider) {
    _animationController = AnimationController(
        vsync: provider,
        duration: Duration(milliseconds: _durationMs)
    );
    offset = Tween(
        begin: Offset.zero,
        end: defaultOffset,
    ).animate(_animationController);
    // 처음에는 레이아웃을 보여주지 않습니다.
    hide();
  }

  /// 등장 방향 (오프셋)을 정의합니다.
  @protected
  Offset get defaultOffset;

  /// 레이아웃을 등장시킵니다.
  void show() {
    _visible = true;
    _animationController.reverse();
  }

  /// 레이아웃을 퇴장시킵니다.
  void hide() {
    _visible = false;
    _animationController.forward();
  }

}

/// 자주 사용하는 오프셋을 정리한 클래스입니다.
///
/// 담당자: 김호
///
class SliderAnimationOffset {

  static Offset get leftLayout    => Offset(-1.0, 0.0 );
  static Offset get rightLayout   => Offset(2.0 , 0.0 );
  static Offset get topLayout     => Offset(0.0 , -1.0);
  static Offset get bottomLayout  => Offset(0.0 , 2.0 );

}
