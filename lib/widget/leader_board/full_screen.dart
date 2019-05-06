import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:questrip/controller/leader_board/full_screen.dart';
import 'package:questrip/res/lib.dart';

/// 이미지를 전체화면으로 보여주는 클래스입니다.
///
/// 담당자: 김호
///
class FullScreenWidget extends StatelessWidget {

  final FullScreenController _controller = FullScreenController();

  @override
  Widget build(BuildContext context) {
    _controller.init(context);
    return Scaffold(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.0),
        body: Container(
          alignment: Alignment.center,
          child: PhotoView(
              imageProvider: NetworkImage(
                R.uri.pathImage + _controller.imagePath,
              )
          ),
        )
    );
  }

}
