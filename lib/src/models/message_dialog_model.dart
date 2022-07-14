
 import 'package:dialogpack/src/assets/color_assets.dart';
import 'package:dialogpack/src/models/message_dialog_style.dart';
import 'package:flutter/material.dart';

class MessageDialogModel{

    final String? gif;
    final String? assetImage;
    final IconData? icon;
    final String? title;
    final String message;
    final String positiveClickText;
    final String? negativeClickText;
    final String? neutralClickText;
    final Function? onPositiveClicked;
    final Function? onNegativeClicked;
    final Function? onNeutralClicked;
    final bool cancellableOnTapOutside;
    final bool autoDismissAfterClick;
    final MessageDialogStyle? messageDialogStyle;

    MessageDialogModel(
    {

      required this.message,
      this.title,
      this.icon,
      this.assetImage,
      this.gif,
      this.positiveClickText = "Ok",
      this.negativeClickText,
      this.neutralClickText,
      this.onPositiveClicked,
      this.onNegativeClicked,
      this.onNeutralClicked,
      this.cancellableOnTapOutside=true,
      this.autoDismissAfterClick = true,
      this.messageDialogStyle,
 }
        );
 }