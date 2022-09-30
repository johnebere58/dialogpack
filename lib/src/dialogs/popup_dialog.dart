import 'dart:async';
import 'package:dialogpack/dialogpack.dart';
import 'package:dialogpack/src/assets/color_assets.dart';
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
  late PopupDialogStyle popupDialogStyle;
  bool showBack = false;
  bool hideUI = true;

  @override
  void initState() {
    super.initState();
    popupDialogModel = widget.popupDialogModel;
    //The message dialog style
    popupDialogStyle = popupDialogModel.popupDialogStyle ??
        DialogManager.defaultPopupDialogStyle;
    if (popupDialogModel.inheritStyle) {
      popupDialogStyle =
          popupDialogStyle.inherit(DialogManager.defaultPopupDialogStyle);
    } else {
      popupDialogStyle = popupDialogStyle.inherit(PopupDialogStyle());
    }

    Future.delayed(const Duration(milliseconds: 200), () {
      hideUI = false;
      setState(() {});
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      showBack = true;
      if(mounted)setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(Duration(
        milliseconds: popupDialogModel.durationInMilliseconds
      ),(){
       closePage((){ Navigator.pop(context);});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    DialogStyle dialogStyle = popupDialogStyle.dialogStyle!;
    DialogPlacement dialogPlacement = dialogStyle.dialogPlacement;
    double margin = dialogStyle.margin;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(fit: StackFit.expand, children: <Widget>[
        GestureDetector(
          onTap: () {
            closePage(() {
              Navigator.pop(context);
            });
          },
          key: const ValueKey("tapToClose"),
          child: AnimatedOpacity(
            opacity: showBack ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: Container(
      color: Colors.black.withOpacity(.7),
      ),
          ),
        ),
        dialogPlacement==DialogPlacement.top && margin==0?page():SafeArea(child: page()),
      ]),
    );
  }

  Widget page() {
    IconData? icon = popupDialogModel.icon;
    String message = popupDialogModel.message;

    Color messageTextColor = popupDialogStyle.messageTextColor ?? white;
    Color boxColor = popupDialogStyle.boxColor ?? black;
    double messageTextSize = popupDialogStyle.messageTextSize!;

    //The dialog style
    DialogStyle dialogStyle = popupDialogStyle.dialogStyle!;
    double curvedRadius = dialogStyle.curvedRadius;
    double elevation = dialogStyle.elevation;
    DialogPlacement dialogPlacement = dialogStyle.dialogPlacement;
    double margin = dialogStyle.margin;

    double topOffset = dialogPlacement==DialogPlacement.top && margin==0?50:0;

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
                padding:  EdgeInsets.fromLTRB(20, 20 +topOffset, 20, 20),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(icon!=null)Container(
                      margin:const EdgeInsets.only(right: 10),
                      child:
                          Icon(icon,color: messageTextColor,size: messageTextSize,),
                    ),
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
      if(mounted)onClosed();
    });
  }
}
