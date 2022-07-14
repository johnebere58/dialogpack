import 'package:flutter/material.dart';

class ScreenUtils{

  static double getScreenHeight(context){
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(context){
    return MediaQuery.of(context).size.width;
  }

}