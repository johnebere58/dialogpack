
import 'package:dialogpack/dialogpack.dart';
import 'package:flutter/material.dart';

class PopupDialogStyle{

   final Color? messageTextColor;
   final Color? boxColor;
   final double? messageTextSize;
   final DialogStyle? dialogStyle;

   PopupDialogStyle(
       {
         this.messageTextColor,
         this.boxColor,
         this.dialogStyle = const DialogStyle(dialogPlacement: DialogPlacement.top,margin: 0.0,elevation: 0,curvedRadius: 0,),
         this.messageTextSize=18.0,
       });

   PopupDialogStyle.empty(
       {
         this.messageTextColor,
         this.boxColor,
         this.dialogStyle,
         this.messageTextSize,
       }
       );


   PopupDialogStyle inherit(PopupDialogStyle popupDialogStyle){
     return PopupDialogStyle.empty(
         messageTextColor: messageTextColor ?? popupDialogStyle.messageTextColor,
         boxColor: boxColor ?? popupDialogStyle.boxColor,
         dialogStyle: dialogStyle ?? popupDialogStyle.dialogStyle,
         messageTextSize: messageTextSize ?? popupDialogStyle.messageTextSize,
       );
}
}