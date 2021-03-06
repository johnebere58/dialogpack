
import 'package:dialogpack/dialogpack.dart';
import 'package:flutter/material.dart';

class ListDialogStyle{

   final Color? globalCheckBoxColor;
   final Color? titleTextColor;
   final double? titleTextSize;
   final double? messageTextSize;
   final double? dialogButtonTextSize;
   final double? dialogButtonHeight;
   final DialogButtonDesign? dialogButtonDesign;
   final Color? buttonColor;
   final DialogStyle? dialogStyle;
   final double? buttonSpacing;
   final DialogButtonFit? dialogButtonFit;
   final DialogButtonAlignment? dialogButtonAlignment;
   final double? dialogButtonCornerRadius;
   final double? itemSpacing;
   final bool? showButtonDivider;

   ListDialogStyle(
       {
         this.globalCheckBoxColor,
         this.titleTextColor,
         this.buttonColor,
         this.dialogButtonDesign = DialogButtonDesign.filled,
         this.dialogButtonFit = DialogButtonFit.stretch,
         this.dialogButtonAlignment = DialogButtonAlignment.center,
         this.dialogStyle = const DialogStyle(),
         this.titleTextSize=25.0,
         this.messageTextSize=17.0,
         this.dialogButtonTextSize=18.0,
         this.dialogButtonHeight=45,
         this.buttonSpacing=5.0,
         this.dialogButtonCornerRadius = 5.0,
         this.itemSpacing = 10.0,
         this.showButtonDivider=false
       });

   ListDialogStyle.empty(
       {
         this.globalCheckBoxColor,
         this.titleTextColor,
         this.dialogButtonDesign,
         this.dialogButtonFit,
         this.dialogButtonAlignment,
         this.dialogStyle,
         this.titleTextSize,
         this.messageTextSize,
         this.dialogButtonTextSize,
         this.dialogButtonHeight,
         this.buttonSpacing,
         this.dialogButtonCornerRadius,
         this.showButtonDivider,
         this.itemSpacing,
         this.buttonColor

       }
       );


   ListDialogStyle inherit(ListDialogStyle listDialogStyle){
     return ListDialogStyle.empty(
        buttonSpacing: buttonSpacing ?? listDialogStyle.buttonSpacing,
       dialogButtonAlignment: dialogButtonAlignment ?? listDialogStyle.dialogButtonAlignment,
       dialogButtonFit: dialogButtonFit ?? listDialogStyle.dialogButtonFit,
       dialogButtonDesign: dialogButtonDesign ?? listDialogStyle.dialogButtonDesign,
       dialogStyle: dialogStyle ?? listDialogStyle.dialogStyle,
       messageTextSize: messageTextSize ?? listDialogStyle.messageTextSize,
       showButtonDivider: showButtonDivider ?? listDialogStyle.showButtonDivider,
       titleTextColor: titleTextColor ?? listDialogStyle.titleTextColor,
       titleTextSize: titleTextSize ?? listDialogStyle.titleTextSize,
       dialogButtonCornerRadius: dialogButtonCornerRadius ?? listDialogStyle.dialogButtonCornerRadius,
       dialogButtonTextSize: dialogButtonTextSize ?? listDialogStyle.dialogButtonTextSize,
       dialogButtonHeight: dialogButtonHeight ?? listDialogStyle.dialogButtonHeight,
       itemSpacing: itemSpacing ?? listDialogStyle.itemSpacing,
       buttonColor: buttonColor ?? listDialogStyle.buttonColor,
       );
}
}