import 'dart:async';
import 'package:dialogpack/dialogpack.dart';
import 'package:dialogpack/src/assets/color_assets.dart';
import 'package:dialogpack/src/models/popup_dialog_model.dart';
import 'package:dialogpack/src/models/popup_dialog_style.dart';
import 'package:dialogpack/src/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:dialogpack/src/utils/widget_utils.dart';

class PopupDialog extends StatefulWidget {
  final PopupDialogModel popupDialogModel;

  const PopupDialog({required this.popupDialogModel, Key? key})
      : super(key: key);

  @override
  PopupDialogState createState() => PopupDialogState();
}

class PopupDialogState extends State<PopupDialog> {
  late PopupDialogModel popupDialogModel;
  bool showBack = false;
  bool hideUI = true;

  @override
  void initState() {
    super.initState();
    popupDialogModel = widget.popupDialogModel;

    Future.delayed(const Duration(milliseconds: 200), () {
      hideUI = false;
      setState(() {});
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      showBack = true;
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(
        milliseconds: popupDialogModel.durationInMilliseconds
      ),(){
        Navigator.pop(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: IgnorePointer(ignoring: true, child: page()));
  }

  Widget page() {
    IconData? icon = popupDialogModel.icon;
    String message = popupDialogModel.message;

    //The message dialog style
    PopupDialogStyle popupDialogStyle = popupDialogModel.popupDialogStyle ??
        DialogManager.defaultPopupDialogStyle;
    if (popupDialogModel.inheritStyle) {
      popupDialogStyle =
          popupDialogStyle.inherit(DialogManager.defaultPopupDialogStyle);
    } else {
      popupDialogStyle = popupDialogStyle.inherit(PopupDialogStyle());
    }

    Color messageTextColor = popupDialogStyle.titleTextColor ?? white;
    Color boxColor = popupDialogStyle.boxColor ?? Colors.blue;
    double messageTextSize = popupDialogStyle.messageTextSize!;

    //The dialog style
    DialogStyle dialogStyle = popupDialogStyle.dialogStyle!;
    double curvedRadius = dialogStyle.curvedRadius;
    double elevation = dialogStyle.elevation;
    DialogPlacement dialogPlacement = dialogStyle.dialogPlacement;
    double margin = dialogStyle.margin;


    return Align(
      alignment: dialogPlacement == DialogPlacement.top
          ? Alignment.topCenter
          : dialogPlacement == DialogPlacement.bottom
              ? Alignment.bottomCenter
              : Alignment.center,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(margin, margin, margin, margin),
            width:
                getScreenWidth(context) > 500 ? 500 : getScreenWidth(context),
            child: Card(
              clipBehavior: Clip.antiAlias,
              color: boxColor,
              elevation: elevation,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(curvedRadius)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:const EdgeInsets.only(right: 8),
                      child:
                          Icon(icon,color: messageTextColor,size: messageTextSize,),
                    ),
                    // Icon(Icons.error_outline,color: white,),
                    addSpaceWidth(10),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        message,
                        style: textStyle(
                            false,
                            messageTextSize,
                            messageTextColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  closePage(onClosed) {
    showBack = false;
    if (mounted) setState(() {});
    Future.delayed(const Duration(milliseconds: 300), () {
      Future.delayed(const Duration(milliseconds: 100), () {
        hideUI = true;
        if (mounted) setState(() {});
      });
      onClosed();
    });
  }
}
