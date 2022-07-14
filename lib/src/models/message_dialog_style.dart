
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
   final ImageOrIconStyle imageOrIconStyle;

   MessageDialogStyle(
       {
         this.titleTextColor,
         this.messageTextColor,
         required this.dialogButtonStyle,
         this.positiveTextButtonColor=Colors.blue,
         this.negativeTextButtonColor=Colors.red,
         this.neutralTextButtonColor=Colors.green,
         this.dialogStyle = const DialogStyle(),
         this.imageOrIconStyle = const ImageOrIconStyle(),
         this.titleTextSize=25.0,
         this.messageTextSize=17.0
       }
       );

 }