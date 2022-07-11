import 'dart:io';

import 'package:dialogpack/src/assets/color_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dialogpack/src/utils/transitions.dart';

Container addLine(
    double size, Color color, double left, double top, double right, double bottom) {
  return Container(
    height: size,
    width: double.infinity,
    color: color,
    margin: EdgeInsets.fromLTRB(left, top, right, bottom),
  );
}

///Add a custom margin line [hm = horizontal margin] [vm = vertical margin]
Widget customDivider({double hm=0,double vm=0}){
  return addLine(.5, blackColor.withOpacity(bestOpacity), hm, vm, hm, vm);
}

SizedBox addSpace(double size) {
  return SizedBox(
    height: size,
  );
}

addSpaceWidth(double size) {
  return SizedBox(
    width: size,
  );
}

TextStyle textStyle(bool bold, double size, color,
    {underlined = false, bool withShadow = false,
      double shadowOffset=4.0,
      bool crossed=false,
      bool italic=false}) {

  return TextStyle(
      color: color,
      fontWeight: bold?FontWeight.bold:FontWeight.normal,
      fontStyle: italic?FontStyle.italic:FontStyle.normal,
      fontSize: size,
      shadows: !withShadow
          ? null
          : (<Shadow>[
        Shadow(offset: Offset(shadowOffset,shadowOffset), blurRadius: 6.0, color: Colors.black.withOpacity(.5)),
      ]),
      decoration:
      crossed?TextDecoration.lineThrough:underlined ? TextDecoration.underline : TextDecoration.none);
}

launchNewScreen(BuildContext context, item, {Function(dynamic d)? result,
  opaque = false,bool replace=false,
  transitionBuilder,transitionDuration,bool scale=false,
  slideUp=false,slide=false,fade=false,bool ignoreIOS=true}) {

  PageRoute pageRoute =

  Platform.isIOS && !ignoreIOS
      ? CupertinoPageRoute(builder: (context) {
    return item;
  },) :
  PageRouteBuilder(
      transitionsBuilder:
      fade?fadeTransition:
      slideUp?slideUpTransition:
      transitionBuilder??
          slideTransition,
      transitionDuration: transitionDuration??const Duration(milliseconds: 300),
      opaque: opaque,
      pageBuilder: (context, _, __) {
        return item;
      });

  if(replace){
    Navigator.pushReplacement(
        context,
        pageRoute).then((_) {
      if (_ != null) {
        if (result != null) result(_);
      }
    });
    return;
  }
  Navigator.push(
      context,
      pageRoute).then((_) {
    if (_ != null) {
      if (result != null) result(_);
    }
  });

}



