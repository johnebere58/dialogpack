
import 'package:dialogpack/dialogpack.dart';
import 'package:flutter/material.dart';

class PopupDialogStyle{

   final Color? titleTextColor;
   final Color? boxColor;
   final double? messageTextSize;
   final DialogStyle? dialogStyle;

   PopupDialogStyle(
       {
         this.titleTextColor,
         this.boxColor,
         this.dialogStyle = const DialogStyle(),
         this.messageTextSize=18.0,
       });

   PopupDialogStyle.empty(
       {
         this.titleTextColor,
         this.boxColor,
         this.dialogStyle,
         this.messageTextSize,
       }
       );


   PopupDialogStyle inherit(PopupDialogStyle popupDialogStyle){
     return PopupDialogStyle.empty(
         titleTextColor: titleTextColor ?? popupDialogStyle.titleTextColor,
         boxColor: boxColor ?? popupDialogStyle.boxColor,
         dialogStyle: dialogStyle ?? popupDialogStyle.dialogStyle,
         messageTextSize: messageTextSize ?? popupDialogStyle.messageTextSize,
       );
}
}