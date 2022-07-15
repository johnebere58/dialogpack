
import 'package:flutter/material.dart';

class StyleUtils {



  static ButtonStyle buttonStyle1({double borderRadius=0,Color color=Colors.blue}){
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide.none
      ) ,
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      backgroundColor: Colors.transparent,primary: color,
      textStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,)
    );
  }

  static ButtonStyle buttonStyle2({double borderRadius=0,Color color=Colors.blue}){
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide.none
      ) ,
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      backgroundColor: color, primary: Colors.white,
      textStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,)
    );
  }

  static ButtonStyle buttonStyle3({double borderRadius=0,Color color=Colors.blue}){
    return TextButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: color,
              width: 1.0,
            )
        ) ,
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        backgroundColor: Colors.transparent,primary: color,
        textStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,)
    );
  }


}