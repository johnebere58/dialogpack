
import 'package:dialogpack/dialogpack.dart';
import 'package:dialogpack/src/models/input_design.dart';
import 'package:flutter/material.dart';

class InputDialogStyle{

   final Color? titleTextColor;
   final double? titleTextSize;
   final double? dialogButtonTextSize;
   final double? dialogButtonHeight;
   final DialogButtonDesign? dialogButtonDesign;
   final Color? buttonColor;
   final Color? inputFocusedColor;
   final DialogStyle? dialogStyle;
   final double? buttonSpacing;
   final DialogButtonFit? dialogButtonFit;
   final DialogButtonAlignment? dialogButtonAlignment;
   final double? dialogButtonCornerRadius;
   final double? inputCornerRadius;
   final double? itemSpacing;
   final bool? showButtonDivider;
   // final bool? checkable;
   final InputDesign? inputDesign;

   InputDialogStyle(
       {
         this.titleTextColor,
         this.buttonColor,
         this.dialogButtonDesign = DialogButtonDesign.filled,
         this.dialogButtonFit = DialogButtonFit.stretch,
         this.dialogButtonAlignment = DialogButtonAlignment.center,
         this.dialogStyle = const DialogStyle(),
         this.titleTextSize=25.0,
         this.dialogButtonTextSize=18.0,
         this.dialogButtonHeight=45,
         this.buttonSpacing=5.0,
         this.dialogButtonCornerRadius = 5.0,
         this.inputCornerRadius = 5.0,
         this.itemSpacing = 5.0,
         this.showButtonDivider=true,
         // this.checkable=false,
         this.inputDesign = InputDesign.normal,
         this.inputFocusedColor = Colors.blue
       });

   InputDialogStyle.empty(
       {
         this.titleTextColor,
         this.dialogButtonDesign,
         this.dialogButtonFit,
         this.dialogButtonAlignment,
         this.dialogStyle,
         this.titleTextSize,
         this.dialogButtonTextSize,
         this.dialogButtonHeight,
         this.buttonSpacing,
         this.dialogButtonCornerRadius,
         this.showButtonDivider,
         this.itemSpacing,
         this.buttonColor,
         // this.checkable,
         this.inputDesign,
         this.inputCornerRadius,
         this.inputFocusedColor,
       }
       );


   InputDialogStyle inherit(InputDialogStyle inputDialogStyle){
     return InputDialogStyle.empty(
        buttonSpacing: buttonSpacing ?? inputDialogStyle.buttonSpacing,
       dialogButtonAlignment: dialogButtonAlignment ?? inputDialogStyle.dialogButtonAlignment,
       dialogButtonFit: dialogButtonFit ?? inputDialogStyle.dialogButtonFit,
       dialogButtonDesign: dialogButtonDesign ?? inputDialogStyle.dialogButtonDesign,
       dialogStyle: dialogStyle ?? inputDialogStyle.dialogStyle,
       showButtonDivider: showButtonDivider ?? inputDialogStyle.showButtonDivider,
       titleTextColor: titleTextColor ?? inputDialogStyle.titleTextColor,
       titleTextSize: titleTextSize ?? inputDialogStyle.titleTextSize,
       dialogButtonCornerRadius: dialogButtonCornerRadius ?? inputDialogStyle.dialogButtonCornerRadius,
       dialogButtonTextSize: dialogButtonTextSize ?? inputDialogStyle.dialogButtonTextSize,
       dialogButtonHeight: dialogButtonHeight ?? inputDialogStyle.dialogButtonHeight,
       itemSpacing: itemSpacing ?? inputDialogStyle.itemSpacing,
       buttonColor: buttonColor ?? inputDialogStyle.buttonColor,
       // checkable: checkable ?? inputDialogStyle.checkable,
       inputDesign: inputDesign ?? inputDialogStyle.inputDesign,
       inputCornerRadius: inputCornerRadius ?? inputDialogStyle.inputCornerRadius,
       inputFocusedColor: inputFocusedColor ?? inputDialogStyle.inputFocusedColor,
       );
}
}