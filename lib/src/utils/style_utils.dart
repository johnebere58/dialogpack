
import 'package:flutter/material.dart';

typedef MyButtonStyle(double borderRadius, Color buttonColor);

class StyleUtils {

  // static DialogButtonStyle get defaultPositiveButton => defaultButtonStyle();
  // static DialogButtonStyle get defaultNegativeButton => defaultButtonStyle(
  //   textColor: Colors.red
  // );
  // static DialogButtonStyle get defaultNeutralButton => defaultButtonStyle(
  //   textColor: Colors.green
  // );

  // static DialogButtonStyle defaultButtonStyle({double borderRadius = 25.0,
  //     double textSize = 18.0,
  //   Color textColor = Colors.blue,
  //   Color buttonColor = Colors.transparent}) {
  //   return DialogButtonStyle(buttonStyle: TextButton.styleFrom(
  //       shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(25)),
  //       padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
  //       textStyle: TextStyle(
  //           fontSize: textSize, color: textColor
  //       ),
  //     backgroundColor: buttonColor
  //   ),);
  // }



  static ButtonStyle buttonStyle1({double borderRadius=0,Color color=Colors.blue}){
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide.none
      ) ,
      backgroundColor: Colors.transparent,
      textStyle: TextStyle(color: color)
    );
  }

  static ButtonStyle buttonStyle2({double borderRadius=0,Color color=Colors.blue}){
    return TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide.none
      ) ,
      backgroundColor: color,
      textStyle: const TextStyle(color: Colors.white)
    );
  }

  static ButtonStyle buttonStyle3({double borderRadius=0,Color color=Colors.blue}){
    return TextButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(
              color: color,
              width: 1.5,
            )
        ) ,
        backgroundColor: Colors.transparent,
        textStyle: TextStyle(color: color)
    );
  }


}