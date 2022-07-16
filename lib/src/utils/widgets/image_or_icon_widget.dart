
import 'package:dialogpack/dialogpack.dart';
import 'package:dialogpack/src/assets/color_assets.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class ImageOrIconWidget extends StatefulWidget {
  final MessageDialogModel messageDialogModel;
  final MessageDialogStyle messageDialogStyle;
  const ImageOrIconWidget({required this.messageDialogModel,required this.messageDialogStyle,Key? key}) : super(key: key);

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
    imageOrIconStyle = widget.messageDialogStyle.imageOrIconStyle!;
  }

  @override
  Widget build(BuildContext context) {

    IconData? icon = messageDialogModel.icon;
    String? image = messageDialogModel.assetImage;
    String? gif = messageDialogModel.gif;
    double imageOrIconSize = imageOrIconStyle.size;
    // ShapeBorder shape = imageOrIconStyle.shape;
    Color? imageOrIconColor = imageOrIconStyle.color;
    double imageOrIconMargin = imageOrIconStyle.margin;
    double imageOrIconPadding = imageOrIconStyle.padding;

    return Container(
      margin: EdgeInsets.all(imageOrIconMargin),
        decoration: BoxDecoration(
            color: whiteColor,shape: BoxShape.circle
        ),
        width: imageOrIconSize,height: imageOrIconSize,
        padding: EdgeInsets.all(imageOrIconPadding),
        child:
        gif!=null?
        Gif(
          image: AssetImage(gif,package: messageDialogModel.assetPackage,),
          color: imageOrIconColor,
          placeholder: (c)=>Container(),
          autostart: Autostart.once,
        ):

        (icon == null && image !=null)
            ? (Image.asset(
          image,fit: BoxFit.cover,
          height: imageOrIconSize,
          color: imageOrIconColor,package: messageDialogModel.assetPackage,
        ))
            : Icon(
          icon,
          color: imageOrIconColor,
          size: imageOrIconSize,
        )
    );
  }
}
