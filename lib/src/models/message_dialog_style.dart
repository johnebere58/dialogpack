
import 'package:dialogpack/src/models/button_placement.dart';
import 'package:dialogpack/src/models/dialog_button_style.dart';
import 'package:dialogpack/src/models/dialog_style.dart';
import 'package:dialogpack/src/models/image_or_icon_style.dart';
import 'package:flutter/material.dart';

class MessageDialogStyle{


   final Color? titleTextColor;
   final Color? messageTextColor;
   final double titleTextSize;
   final double messageTextSize;
   final DialogButtonStyle dialogButtonStyle;
   final Color positiveTextButtonColor;
   final Color negativeTextButtonColor;
   final Color neutralTextButtonColor;
   final DialogStyle dialogStyle;
   final double buttonSpacing;

   MessageDialogStyle(
       {
         this.titleTextColor,
         this.messageTextColor,
         this.dialogButtonStyle = DialogButtonStyle.transparent,
         this.positiveTextButtonColor=Colors.blue,
         this.negativeTextButtonColor=Colors.red,
         this.neutralTextButtonColor=Colors.green,
         this.dialogStyle = const DialogStyle(),
         this.titleTextSize=25.0,
         this.messageTextSize=17.0,
         this.buttonSpacing=0.0
       }
       );

 }