
 import 'package:flutter/material.dart';

class MessageDialogModel{

    final String? assetImage;
    final IconData? icon;
    final Color iconColor;
    final double iconPadding;
    final String? title;
    final String message;
    final String positiveClickText;
    final String? negativeClickText;
    final String? neutralClickText;
    final Function? onPositiveClicked;
    final Function? onNegativeClicked;
    final Function? onNeutralClicked;
    final bool cancellableOnTapOutside;
    final Color titleTextColor;
    final Color messageTextColor;
    final Color positiveTextColor;
    final Color negativeTextColor;
    final Color neutralTextColor;
    final bool autoDismissAfterClick;

    MessageDialogModel(
    {

      required this.message,
      this.title,
      this.icon,
      this.assetImage,
      this.iconColor= Colors.blue,
      this.iconPadding = 10.0,
      this.positiveClickText = "Ok",
      this.negativeClickText,
      this.neutralClickText,
      this.onPositiveClicked,
      this.onNegativeClicked,
      this.onNeutralClicked,
      this.cancellableOnTapOutside=true,
      this.titleTextColor = Colors.black,
      this.messageTextColor = Colors.black54,
      this.positiveTextColor = Colors.blue,
      this.negativeTextColor = Colors.red,
      this.neutralTextColor = Colors.black45,
      this.autoDismissAfterClick = true,
 }
        );
 }