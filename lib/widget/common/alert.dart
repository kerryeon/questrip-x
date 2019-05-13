import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:questrip/lib.dart';
import 'package:questrip/net/lib.dart';
import 'package:questrip/res/lib.dart';
import 'package:questrip/controller/board/leader_board.dart';
import 'dart:io';

/// 알림창, Toast 팝업 다이얼로그 등의 기능을 총괄합니다.
/// 
/// 담당자: 김호

/// 알림창을 띄웁니다.
void dialog(final BuildContext context, final String msgId,
    { Runnable onConfirm, Runnable onCancel }) {
  onCancel == null
      ? _dialogSimple(context, msgId, onConfirm: onConfirm)
      : _dialogAsk(context, msgId, onConfirm: onConfirm, onCancel: onCancel);
}

/// 사용자에게 오류를 알림창을 통해 알립니다.
void dialogFailed(final BuildContext context, final Failed failed,
    { Runnable onConfirm, final String rejected, final String canceled }) {
  String msgId;
  switch (failed) {
    case Failed.INTERNAL:
      msgId = R.string.common_failure_internal;
      break;
    case Failed.NETWORK_FAILURE:
      msgId = R.string.common_failure_network;
      break;
    case Failed.REJECTED:
      msgId = rejected ?? R.string.common_failure_unknown;
      break;
    case Failed.USER_CANCELED:
      msgId = canceled ?? R.string.common_failure_unknown;
      break;
    case Failed.UNEXPECTED:
      msgId = R.string.common_failure_unknown;
      break;
  }
  _dialogSimple(context, msgId, onConfirm: onConfirm);
}

/// 사용자에게 오류를 알림창을 통해 알립니다.
Future<bool> dialogExit(final BuildContext context) async {
  _dialogAsk(context, R.string.common_alert_field_close_app, onConfirm: exit);
  return false;
}

/// Toast 메세지를 띄웁니다.
void toast(String msgId) {
  Fluttertoast.showToast(
    msg: msgId,
    toastLength: Toast.LENGTH_LONG,
    backgroundColor: Colors.grey,
  );
}

/// 확인 버튼 하나있는 간단한 알림창을 띄웁니다.
void _dialogSimple(final BuildContext context, final String msg,
    { Runnable onConfirm }) async {
  showDialog(context: context,
    barrierDismissible: onConfirm == null,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(R.string.common_alert_title),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
              child: Text(R.string.common_alert_confirm),
              onPressed: () {
                Navigator.of(context).pop();
                if (onConfirm != null) onConfirm();
              }
          ),
        ],
      );
    },
  );
}

/// 예, 아니오 버튼이 있는 알림창을 띄웁니다.
void _dialogAsk(final BuildContext context, final String msg,
    { Runnable onConfirm, Runnable onCancel }) {
  showDialog(context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(R.string.common_alert_title),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(
              child: Text(R.string.common_alert_choose_yes),
              onPressed: () {
                Navigator.of(context).pop();
                if (onConfirm != null) onConfirm();
              }
          ),
          FlatButton(
              child: Text(R.string.common_alert_choose_no),
              onPressed: () {
                Navigator.of(context).pop();
                if (onCancel != null) onCancel();
              }
          ),
        ],
      );
    },
  );
}

/// 알림창을 통해서 촬영을 하거나 앨범에 접근합니다.
void showSimpleDialog(final BuildContext context) {
  showDialog(
      context: context,
      child: SimpleDialog(
        title: Text(R.string.view_button_submit),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () => {
            CameraPicture.showCamera(context),
            Navigator.of(context).pop()
            },
            child: Text(R.string.common_alert_camera),
          ),
          Padding(
            padding: EdgeInsets.all(4.0),
          ),
          SimpleDialogOption(
            onPressed: () => {
            GallerySelect.showGallery(context),
            Navigator.of(context).pop()
            },
            child: Text(R.string.common_alert_gallery),
          ),
        ],
      )
  );
}

/// 알림창을 통해서 결과물을 제출하거나, 다시 가져오거나, 취소합니다.
void showAlertDialog(final BuildContext context, final File image) {
  showDialog(
      context: context,
      child: AlertDialog(
        title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(R.string.view_button_submit)
              ],
            )
        ),
        content: Container(
          constraints: BoxConstraints(minWidth: 100.0, maxHeight: 250.0),
          child: Center(
            child: image == null ? Text(R.string.common_failure_unknown) : Image.file(image),
          ),
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () => {
              Navigator.of(context).pop(),
              dialog(context, R.string.view_alert_submitted, onCancel: null)
              },
              child: Text(R.string.common_alert_button_submit)
          ),
          FlatButton(
              onPressed: () => {
              Navigator.of(context).pop(),
              showSimpleDialog(context)
              },
              child: Text(R.string.common_alert_reselect)
          ),
          FlatButton(
              onPressed: () => {
              toast(R.string.common_alert_canceled),
              Navigator.of(context).pop()
              },
              child: Text(R.string.common_alert_cancel)
          )
        ],
      )
  );
}