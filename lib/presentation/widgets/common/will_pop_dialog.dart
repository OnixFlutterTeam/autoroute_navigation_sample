import 'dart:async';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WillPopDialog {
  static Future<bool> onTryCloseApp(BuildContext context) async {
    final completer = Completer<bool>();
    final result = await showOkCancelAlertDialog(
      context: context,
      title: 'Exit the app?',
      okLabel: 'Exit',
      cancelLabel: 'Cancel',
      defaultType: OkCancelAlertDefaultType.ok,
      alertStyle: AdaptiveStyle.adaptive,
    );

    if (result == OkCancelResult.ok) {
      completer.complete(true);
    } else {
      completer.complete(false);
    }
    return completer.future;
  }
}
