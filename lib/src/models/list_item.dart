
import 'package:flutter/cupertino.dart';

class ListItem {
  final String title;
  final String? subtitle;
  final String? image;
  final IconData? icon;
  final Color? titleColor;
  final Color? subtitleColor;
  final Color? iconOrImageColor;


  ListItem({required this.title,this.subtitle,this.image,this.icon,
           this.iconOrImageColor,this.titleColor,this.subtitleColor});

  String get itemKey => "$title${subtitle??""}";
}