
import 'package:dialogpack/src/models/button_placement.dart';
import 'package:dialogpack/src/models/dialog_button_style.dart';
import 'package:dialogpack/src/models/image_or_icon_style.dart';
import 'package:dialogpack/src/models/message_dialog_style.dart';
import 'package:flutter/material.dart';

class StyleUtils {

  static DialogButtonStyle get defaultPositiveButton => defaultButtonStyle();
  static DialogButtonStyle get defaultNegativeButton => defaultButtonStyle(
    textColor: Colors.red
  );
  static DialogButtonStyle get defaultNeutralButton => defaultButtonStyle(
    textColor: Colors.green
  );


  static DialogButtonStyle defaultButtonStyle({double borderRadius = 25.0,
      double textSize = 18.0,
    Color textColor = Colors.blue,
    Color buttonColor = Colors.transparent}) {
    return DialogButtonStyle(buttonStyle: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)),
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        textStyle: TextStyle(
            fontSize: textSize, color: textColor
        ),
      backgroundColor: buttonColor
    ));
  }

}