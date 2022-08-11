import 'package:flutter/cupertino.dart';

class InputItem {
  final String title;
  final String? hint;
  final String? message;
  final String? image;
  final IconData? icon;
  final Color? titleColor;
  final Color? hintColor;
  final Color? iconOrImageColor;
  final Color? textColor;
  final bool obscure;
  final TextInputType inputType;
  final int? maxLength;
  final bool allowEmpty;
  final int maxLine;
  final double? textBoxHeight;
  final double fontSize;
  final double titleSize;
  final double titleSpacing;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;

  InputItem({required this.title,this.hint,this.image,this.icon,
           this.iconOrImageColor,this.titleColor,this.hintColor,this.obscure=false,this.inputType=TextInputType.text,
    this.maxLength,this.allowEmpty=false,this.maxLine=1,
    this.textBoxHeight,
    this.textInputAction= TextInputAction.next,
  this.textCapitalization = TextCapitalization.sentences,
    this.fontSize=18,
    this.titleSize=14,
    this.titleSpacing=15,
    this.textColor,this.message=""
           });

  String get itemKey => "$title${hint??""}";
}