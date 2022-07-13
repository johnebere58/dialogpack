
 import 'package:flutter/material.dart';

class MessageDialogStyle{

   final double iconOrImageSize;
   final Color iconOrImageColor;
   final Color? titleTextColor;
   final Color? messageTextColor;
   final Color positiveTextColor;
   final Color negativeTextColor;
   final Color? neutralTextColor;

   MessageDialogStyle(
       {
         this.iconOrImageColor= Colors.blue,
         this.iconOrImageSize = 60.0,
         this.titleTextColor,
         this.messageTextColor,
         this.positiveTextColor = Colors.blue,
         this.negativeTextColor = Colors.red,
         this.neutralTextColor,

       }
       );
 }