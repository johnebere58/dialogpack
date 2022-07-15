
import 'package:dialogpack/dialogpack.dart';
import 'package:dialogpack/src/models/image_or_icon_style.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class ImageOrIconWidget extends StatefulWidget {
  final MessageDialogModel messageDialogModel;
  const ImageOrIconWidget({required this.messageDialogModel,Key? key}) : super(key: key);

  @override
  ImageOrIconWidgetState createState() => ImageOrIconWidgetState();
}

class ImageOrIconWidgetState extends State<ImageOrIconWidget> {

  late ImageOrIconStyle imageOrIconStyle;
  late MessageDialogModel messageDialogModel;
  @override
  void initState() {
    super.initState();
    messageDialogModel = widget.messageDialogModel;
    imageOrIconStyle = messageDialogModel.imageOrIconStyle;
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
