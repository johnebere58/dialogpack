
import 'package:dialogpack/src/models/button_placement.dart';
import 'package:dialogpack/src/models/dialog_button_alignment.dart';
import 'package:dialogpack/src/models/dialog_button_fit.dart';
import 'package:dialogpack/src/models/dialog_button_style.dart';
import 'package:dialogpack/src/models/dialog_style.dart';
import 'package:dialogpack/src/models/image_or_icon_style.dart';
import 'package:flutter/material.dart';

class MessageDialogStyle{


   final Color? titleTextColor;
   final Color? messageTextColor;
   final double titleTextSize;
   final double messageTextSize;
   final double actionTextSize;
   final DialogButtonStyle dialogButtonStyle;
   final Color positiveTextButtonColor;
   final Color negativeTextButtonColor;
   final Color neutralTextButtonColor;
   final DialogStyle dialogStyle;
   final double buttonSpacing;
   final MessageDialogStyle? messageDialogStyle;
   final ImageOrIconStyle imageOrIconStyle;
   final ButtonPlacement buttonPlacement;
   final DialogButtonFit dialogButtonFit;
   final DialogButtonAlignment dialogButtonAlignment;
   final double buttonCornerRadius;
   final bool showButtonDivider;

   MessageDialogStyle(
       {
         this.titleTextColor,
         this.messageTextColor,
         this.dialogButtonStyle = DialogButtonStyle.filled,
         this.dialogButtonFit = DialogButtonFit.stretch,
         this.buttonPlacement=ButtonPlacement.wrapped,
         this.dialogButtonAlignment = DialogButtonAlignment.center,
         this.positiveTextButtonColor=Colors.blue,
         this.negativeTextButtonColor=Colors.red,
         this.neutralTextButtonColor=Colors.green,
         this.dialogStyle = const DialogStyle(),
         this.titleTextSize=25.0,
         this.messageTextSize=17.0,
         this.actionTextSize=18.0,
         this.buttonSpacing=5.0,
         this.messageDialogStyle,
         this.imageOrIconStyle=const ImageOrIconStyle(),
         this.buttonCornerRadius = 15.0,
         this.showButtonDivider=false
       }
       );

 }