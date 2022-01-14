import 'package:flutter/material.dart';

class DialogDataRequest {
  DialogDataRequest({
    required this.title,
    this.description = '',
    required this.positiveButtonText,
    this.negativeButtonText = '',
    this.positiveButtonTextStyle,
    this.negativeButtonTextStyle,
    this.additionalButtonText = '',
    this.additionalButtonTextStyle,
    this.barrierDismissible = true,
  });

  String title;
  String? description;
  String positiveButtonText;
  String? negativeButtonText;
  String? additionalButtonText;
  final TextStyle? positiveButtonTextStyle;
  final TextStyle? negativeButtonTextStyle;
  final TextStyle? additionalButtonTextStyle;
  bool? barrierDismissible;
}
