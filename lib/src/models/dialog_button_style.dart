
import 'package:dialogpack/src/models/button_placement.dart';
import 'package:flutter/material.dart';

class DialogButtonStyle {

  final ButtonPlacment buttonPlacement;
  final ButtonStyle buttonStyle;
  final double spacing;

  const DialogButtonStyle({
    this.buttonPlacement = ButtonPlacment.wrapped,
    required this.buttonStyle,
    this.spacing=0.0,
  });
}