import 'package:flutter/material.dart';

double getScreenHeight(context){
  return MediaQuery.of(context).size.height;
}

double getScreenWidth(context){
  return MediaQuery.of(context).size.width;
}