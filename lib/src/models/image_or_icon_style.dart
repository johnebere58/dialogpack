
import 'package:dialogpack/src/models/image_or_icon_placement.dart';
import 'package:flutter/material.dart';

class ImageOrIconStyle{

  final double size;
  final double padding;
  final double margin;
  // final ShapeBorder shape;
  final Color? color;
  final ImageOrIconPlacement imageOrIconPlacement;

  const ImageOrIconStyle(
  {
    this.size=60.0,
    // this.shape=const CircleBorder(side: BorderSide.none),
    this.color,
    this.margin = 0.0,
    this.padding = 0.0,
    this.imageOrIconPlacement = ImageOrIconPlacement.normal
}
      );

}