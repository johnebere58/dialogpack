
import 'package:dialogpack/dialogpack.dart';
import 'package:flutter/material.dart';

class MessageDialogStyle{


   final Color? titleTextColor;
   final Color? messageTextColor;
   final double? titleTextSize;
   final double? messageTextSize;
   final double? dialogButtonTextSize;
   final DialogButtonStyle? dialogButtonStyle;
   final Color? positiveTextButtonColor;
   final Color? negativeTextButtonColor;
   final Color? neutralTextButtonColor;
   final DialogStyle? dialogStyle;
   final double? buttonSpacing;
   final ImageOrIconStyle? imageOrIconStyle;
   final ButtonPlacement? buttonPlacement;
   final DialogButtonFit? dialogButtonFit;
   final DialogButtonAlignment? dialogButtonAlignment;
   final double? dialogButtonCornerRadius;
   final bool? showButtonDivider;

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
         this.dialogButtonTextSize=18.0,
         this.buttonSpacing=5.0,
         this.imageOrIconStyle=const ImageOrIconStyle(),
         this.dialogButtonCornerRadius = 5.0,
         this.showButtonDivider=false
       }
       );
   MessageDialogStyle.empty(
       {
         this.titleTextColor,
         this.messageTextColor,
         this.dialogButtonStyle,
         this.dialogButtonFit,
         this.buttonPlacement,
         this.dialogButtonAlignment,
         this.positiveTextButtonColor,
         this.negativeTextButtonColor,
         this.neutralTextButtonColor,
         this.dialogStyle,
         this.titleTextSize,
         this.messageTextSize,
         this.dialogButtonTextSize,
         this.buttonSpacing,
         this.imageOrIconStyle,
         this.dialogButtonCornerRadius,
         this.showButtonDivider
       }
       );


   MessageDialogStyle inherit(MessageDialogStyle messageDialogStyle){
     return MessageDialogStyle.empty(
        buttonSpacing: buttonSpacing ?? messageDialogStyle.buttonSpacing,
        buttonPlacement: buttonPlacement ?? messageDialogStyle.buttonPlacement,
       dialogButtonAlignment: dialogButtonAlignment ?? messageDialogStyle.dialogButtonAlignment,
       dialogButtonFit: dialogButtonFit ?? messageDialogStyle.dialogButtonFit,
       dialogButtonStyle: dialogButtonStyle ?? messageDialogStyle.dialogButtonStyle,
       dialogStyle: dialogStyle ?? messageDialogStyle.dialogStyle,
       imageOrIconStyle: imageOrIconStyle ?? messageDialogStyle.imageOrIconStyle,
       messageTextColor: messageTextColor ?? messageDialogStyle.messageTextColor,
       messageTextSize: messageTextSize ?? messageDialogStyle.messageTextSize,
       negativeTextButtonColor: negativeTextButtonColor ?? messageDialogStyle.negativeTextButtonColor,
       neutralTextButtonColor: neutralTextButtonColor ?? messageDialogStyle.neutralTextButtonColor,
       positiveTextButtonColor: positiveTextButtonColor ?? messageDialogStyle.positiveTextButtonColor,
       showButtonDivider: showButtonDivider ?? messageDialogStyle.showButtonDivider,
       titleTextColor: titleTextColor ?? messageDialogStyle.titleTextColor,
       titleTextSize: titleTextSize ?? messageDialogStyle.titleTextSize,
       dialogButtonCornerRadius: dialogButtonCornerRadius ?? messageDialogStyle.dialogButtonCornerRadius,
       dialogButtonTextSize: dialogButtonTextSize ?? messageDialogStyle.dialogButtonTextSize
       );
}
/*
   MessageDialogStyle copyWith(
       {
     Color? titleTextColor,
     String? messageTextColor,
     double? titleTextSize,
     double? messageTextSize,
     double? dialogButtonTextSize,
     DialogButtonStyle? dialogButtonStyle,
     Color? positiveTextButtonColor,
     Color? negativeTextButtonColor,
     Color? neutralTextButtonColor,
     DialogStyle? dialogStyle,
     double? buttonSpacing,
     ImageOrIconStyle? imageOrIconStyle,
     ButtonPlacement? buttonPlacement,
     DialogButtonFit? dialogButtonFit,
     DialogButtonAlignment? dialogButtonAlignment,
     double? dialogButtonCornerRadius,
     bool? showButtonDivider
}){
     return MessageDialogStyle(
       buttonPlacement: this.buttonPlacement ?? buttonPlacement,
       buttonSpacing: this.buttonSpacing ?? buttonSpacing,
     );
   }*/



}