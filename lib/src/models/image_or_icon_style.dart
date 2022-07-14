
import 'package:dialogpack/src/models/icon_or_icon_placement.dart';
import 'package:flutter/material.dart';

class ImageOrIconStyle{

  final double size;
  final double padding;
  final double margin;
  final ShapeBorder shape;
  final Color color;
  final ImageOrIconPlacement imageOrIconPlacement;

  const ImageOrIconStyle(
  {
    this.size=60,
    this.shape=const CircleBorder(),
    this.color = Colors.blue,
    this.margin = 0.0,
    this.padding = 0.0,
    this.imageOrIconPlacement = ImageOrIconPlacement.normal
}
      );

}