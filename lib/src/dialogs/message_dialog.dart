import 'dart:async';
import 'dart:ui';
import 'package:dialogpack/dialogpack.dart';
import 'package:dialogpack/src/assets/color_assets.dart';
import 'package:dialogpack/src/models/dialog_placement.dart';
import 'package:dialogpack/src/models/dialog_style.dart';
import 'package:dialogpack/src/models/icon_or_icon_placement.dart';
import 'package:dialogpack/src/models/image_or_icon_style.dart';
import 'package:dialogpack/src/models/message_dialog_style.dart';
import 'package:dialogpack/src/utils/screen_utils.dart';
import 'package:dialogpack/src/utils/widgets/image_or_icon_widget.dart';
import 'package:dialogpack/src/utils/widgets/message_dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:dialogpack/src/assets/string_assets.dart';
import 'package:dialogpack/src/blocs/message_dialog_controller.dart';
import 'package:dialogpack/src/utils/widget_utils.dart';
import 'package:flutter/services.dart';


class MessageDialog extends StatefulWidget {
  final MessageDialogModel messageDialogModel;
  final String dialogId; ///Specify dialogId if you wish to terminate this dialog manually

  const MessageDialog(
  {required this.messageDialogModel,this.dialogId=DEFAULT_MESSAGE_DIALOG_ID, Key? key}):super(key:key);

  @override
  MessageDialogState createState() => MessageDialogState();
}

class MessageDialogState extends State<MessageDialog> {

  final List<StreamSubscription> _streamSubscriptions = [];
  late MessageDialogModel messageDialogModel;
  bool showBack=false;
  bool hideUI=true;

  @override
  void initState() {
    messageDialogModel = widget.messageDialogModel;
    super.initState();

    Future.delayed(const Duration(milliseconds: 200),(){
      hideUI=false;
      setState(() {});
    });
    Future.delayed(const Duration(milliseconds: 500),(){
      showBack=true;
      setState(() {

      });
    });

    _streamSubscriptions.add(
      MessageDialogController.instance.stream.listen((String? id) {
        if(id == widget.dialogId){
          closePage(() async {
            Navigator.pop(context);
          });
        }
      })
    );
  }

  @override
  void dispose() {
    for(StreamSubscription stream in _streamSubscriptions) {
      stream.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    bool cancellable = messageDialogModel.cancellableOnTapOutside;

    return WillPopScope(
      onWillPop: () {

        if (cancellable)closePage((){ Navigator.pop(context);});

        return Future.value(false);
      },
      child: Stack(fit: StackFit.expand, children: <Widget>[
        GestureDetector(
          onTap: () {
            if (cancellable) closePage((){ Navigator.pop(context);});
          },
          key: const ValueKey("tapToClose"),
          child: AnimatedOpacity(
            opacity: showBack?1:0,duration: const Duration(milliseconds: 300),
            child: ClipRect(
                child:BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                    child: Container(
                      color: Colors.black.withOpacity(.7),
                    ))
            ),
          ),
        ),
        page(),
        // if(widget.messageDialogModel.gif!=null)
        //   Opacity(opacity: 1,child: Gif(
        //   image: AssetImage("assets/${widget.messageDialogModel.gif}",package: "dialogpack",),
        //   autostart: Autostart.once,
        // ),)
      ]),
    );
  }

  Future<String> loadGif(String gif)async{
    return await rootBundle
        .loadString('packages/dialogpack/lib/assets/$gif');
  }

  Widget page() {

    IconData? icon = messageDialogModel.icon;
    String? image = messageDialogModel.assetImage;
    String? gif = messageDialogModel.gif;
    String? title = messageDialogModel.title;
    String message = messageDialogModel.message;
    Function? positiveClick = messageDialogModel.onPositiveClicked;
    Function? negativeClick = messageDialogModel.onNegativeClicked;
    Function? neutralClick = messageDialogModel.onNeutralClicked;

    //The message dialog style
    MessageDialogStyle messageDialogStyle = messageDialogModel.messageDialogStyle ?? DialogManager.globalMessageDialogStyle
        ?? MessageDialogStyle();

    Color titleTextColor = messageDialogStyle.titleTextColor ?? blackColor;
    Color messageTextColor = messageDialogStyle.titleTextColor ?? (title==null? titleTextColor: blackColor2);
    double titleTextSize = messageDialogStyle.titleTextSize;
    double messageTextSize = messageDialogStyle.messageTextSize;
    bool autoDismiss = messageDialogModel.autoDismissAfterClick;

    //The dialog style
    DialogStyle dialogStyle = messageDialogStyle.dialogStyle;
    // String? appBanner = dialogStyle.appBanner;
    double curvedRadius = dialogStyle.curvedRadius;
    double elevation = dialogStyle.elevation;
    DialogPlacement dialogPlacement = dialogStyle.dialogPlacement;
    double margin = dialogStyle.margin;

    //The imageOrIcon style
    ImageOrIconStyle imageOrIconStyle = messageDialogStyle.imageOrIconStyle;
    ImageOrIconPlacement imageOrIconPlacement = imageOrIconStyle.imageOrIconPlacement;
    bool topImageStyle = imageOrIconPlacement==ImageOrIconPlacement.top;
    double imageOrIconSize = imageOrIconStyle.size;

    bool hasImage = icon!=null || image!=null || gif!=null;
    return Align(
        alignment: dialogPlacement==DialogPlacement.top? Alignment.topCenter:
                    dialogPlacement==DialogPlacement.bottom? Alignment.bottomCenter
                    :Alignment.center,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin:  EdgeInsets.fromLTRB(margin, (hasImage&&topImageStyle)?(imageOrIconSize/2):margin, margin, margin),
            width: getScreenWidth(context)>500?500:getScreenWidth(context),

            child: Card(
              clipBehavior: Clip.antiAlias,
              color: whiteColor,elevation: elevation,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(curvedRadius)),
              child: Padding(
                padding: EdgeInsets.only(top: topImageStyle && hasImage?(imageOrIconSize/3):0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,20,20,15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          if(!topImageStyle && hasImage)
                            Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: ImageOrIconWidget(messageDialogModel: messageDialogModel,messageDialogStyle: messageDialogStyle,)),

                          if(title!=null)Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              title,
                              style: textStyle(true, titleTextSize, titleTextColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Flexible(
                            child: SingleChildScrollView(
                              child: Text(
                                message,
                                style: textStyle(false,
                                    title==null?messageTextSize + 5: messageTextSize,
                                    (messageTextColor)),
                                textAlign: TextAlign.center,
//                                    maxLines: 1,
                              ),
                            ),
                          ),
                          if(message.isNotEmpty)addSpace(10),
                        ],
                      ),
                    ),

                    addLine(1, blackColor.withOpacity(bestOpacity2), 0, 0, 0, 0),

                  MessageDialogButton(messageDialogModel: messageDialogModel,
                    messageDialogStyle: messageDialogStyle,
                    positiveButtonClick: (){
    if(autoDismiss){
    closePage(() async {
    Navigator.pop(context);
    await Future.delayed(const Duration(milliseconds: 200));
    if(positiveClick!=null)positiveClick();
    });
    }else{
    if(positiveClick!=null)positiveClick();
    }
    }, negativeButtonClick: (){
    if(autoDismiss){
    closePage(()async{
    Navigator.pop(context);
    await Future.delayed(const Duration(milliseconds: 200));
    if(negativeClick!=null)negativeClick();
    });
    }else{
    if(negativeClick!=null)negativeClick();
    }
    }, neutralButtonClick: (){
    if(autoDismiss) {
    closePage(() async {
    Navigator.pop(context);
    await Future.delayed(
    const Duration(milliseconds: 200));
    if (neutralClick != null) neutralClick();
    });
    }else{
    if (neutralClick != null) neutralClick();
    }
    })

                  ],
                ),
              ),
            ),
          ),
          if(topImageStyle && hasImage)
            ImageOrIconWidget(messageDialogModel: messageDialogModel,messageDialogStyle: messageDialogStyle,),

        ],
      ),
    );
  }

  closePage(onClosed){
    showBack=false;
    if(mounted)setState(() {});
    Future.delayed(const Duration(milliseconds: 300),(){
      Future.delayed(const Duration(milliseconds: 100),(){
        hideUI=true;
        if(mounted )setState(() {});
      });
      onClosed();
    });
  }
}

