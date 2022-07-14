
import 'package:dialogpack/dialogpack.dart';
import 'package:dialogpack/src/models/image_or_icon_style.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class ImageOrIconWidget extends StatefulWidget {
  final ImageOrIconStyle imageOrIconStyle;
  final MessageDialogModel messageDialogModel;
  const ImageOrIconWidget({required this.messageDialogModel,required this.imageOrIconStyle,Key? key}) : super(key: key);

  @override
  _ImageOrIconWidgetState createState() => _ImageOrIconWidgetState();
}

class _ImageOrIconWidgetState extends State<ImageOrIconWidget> {

  late ImageOrIconStyle imageOrIconStyle;
  late MessageDialogModel messageDialogModel;
  @override
  void initState() {
    super.initState();
    imageOrIconStyle = widget.imageOrIconStyle;
    messageDialogModel = widget.messageDialogModel;
  }

  @override
  Widget build(BuildContext context) {

    IconData? icon = messageDialogModel.icon;
    String? image = messageDialogModel.assetImage;
    String? gif = messageDialogModel.gif;
    double imageOrIconSize = imageOrIconStyle.size;
    ShapeBorder shape = imageOrIconStyle.shape;
    Color imageOrIconColor = imageOrIconStyle.color;
    double imageOrIconMargin = imageOrIconStyle.margin;
    double imageOrIconPadding = imageOrIconStyle.padding;

    return Container(
      margin: EdgeInsets.all(imageOrIconMargin),
        decoration: BoxDecoration(
            color: imageOrIconColor,shape: BoxShape.circle
        ),
        width: imageOrIconSize,height: imageOrIconSize,
        child:
        Card(
          shape: shape,
          child: Padding(
            padding: EdgeInsets.all(imageOrIconPadding),
            child: gif!=null?
            Gif(
              image: AssetImage(gif,package: "dialogpack",),
              color: imageOrIconColor,
              placeholder: (c)=>Container(),
              autostart: Autostart.once,
            ):

            (icon == null && image !=null)
                ? (Image.asset(
              image,
              color: imageOrIconColor,package: "dialogpack",
            ))
                : Icon(
              icon,
              color: imageOrIconColor,
              // size: 75,
            ),
          )
        )
    );
  }
}
