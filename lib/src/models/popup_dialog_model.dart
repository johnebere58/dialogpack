import 'package:dialogpack/src/models/popup_dialog_style.dart';
import 'package:flutter/material.dart';

class PopupDialogModel{

    final IconData? icon;
    final String message;
    final PopupDialogStyle? popupDialogStyle;
    final bool inheritStyle;
    final int durationInMilliseconds;

    PopupDialogModel(
    {

      required this.message,
      this.icon,
      this.popupDialogStyle,
      this.inheritStyle=true,
      this.durationInMilliseconds=1500
   }
        );
 }