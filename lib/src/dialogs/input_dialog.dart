import 'dart:ui';
import 'package:dialogpack/dialogpack.dart';
import 'package:dialogpack/src/assets/color_assets.dart';
import 'package:dialogpack/src/dialog_manager.dart';
import 'package:dialogpack/src/models/dialog_placement.dart';
import 'package:dialogpack/src/models/dialog_style.dart';
import 'package:dialogpack/src/models/input_dialog_model.dart';
import 'package:dialogpack/src/models/input_dialog_style.dart';
import 'package:dialogpack/src/models/input_item.dart';
import 'package:dialogpack/src/utils/screen_utils.dart';
import 'package:dialogpack/src/utils/widget_utils.dart';
import 'package:dialogpack/src/utils/widgets/input_dialog_button.dart';
import 'package:dialogpack/src/utils/widgets/input_text_field.dart';
import 'package:flutter/material.dart';

class InputDialog extends StatefulWidget {

  final InputDialogModel inputDialogModel;
  const InputDialog({required this.inputDialogModel, Key? key}):super(key:key);

  @override
  InputDialogState createState() => InputDialogState();
}

class InputDialogState extends State<InputDialog> {

  late List<TextEditingController> textControllers;
  late InputDialogModel inputDialogModel;
  late List<InputItem> inputItems;
  bool showBack=false;
  bool hideUI=true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inputDialogModel = widget.inputDialogModel;
    List items = inputDialogModel.inputItems;
    inputItems = List.from(items);
    textControllers = List.generate(inputItems.length, (index) => TextEditingController());

    Future.delayed(const Duration(milliseconds: 200),(){
      hideUI=false;
      setState(() {});
    });
    Future.delayed(const Duration(milliseconds: 500),(){
      showBack=true;
      setState(() {});
    });

  }

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand,alignment: Alignment.center,
        children: <Widget>[
      GestureDetector(
        onTap: () {
          closePage((){ Navigator.pop(context);});
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
          SafeArea(child: page()),
    ]);
  }

  Widget page() {

    //The list dialog style
    InputDialogStyle inputDialogStyle = inputDialogModel.inputDialogStyle ?? DialogManager.defaultInputDialogStyle;
    if(inputDialogModel.inheritStyle) {
      inputDialogStyle = inputDialogStyle.inherit(DialogManager.defaultInputDialogStyle);
    }
    else{
      inputDialogStyle = inputDialogStyle.inherit(InputDialogStyle());
    }

    String? title = inputDialogModel.title;
    // Color buttonColor = inputDialogStyle.buttonColor ?? blackColor;
    Color titleColor = inputDialogStyle.titleTextColor ?? blackColor;

    //The dialog style
    DialogStyle dialogStyle = inputDialogStyle.dialogStyle!;
    // String? appBanner = dialogStyle.appBanner;
    double curvedRadius = dialogStyle.curvedRadius;
    double elevation = dialogStyle.elevation;
    DialogPlacement dialogPlacement = dialogStyle.dialogPlacement;
    double margin = dialogStyle.margin;
    double itemSpacing = inputDialogStyle.itemSpacing!;

    return Align(
      alignment: dialogPlacement == DialogPlacement.top
          ? Alignment.topCenter
          : dialogPlacement == DialogPlacement.bottom
          ? Alignment.bottomCenter
          : Alignment.center,
      child: Container(
        margin: EdgeInsets.fromLTRB(
            margin,
            margin,
            margin,
            margin),
        width: getScreenWidth(context)>500?500:getScreenWidth(context),
        child: Card(
          clipBehavior: Clip.antiAlias,margin: EdgeInsets.zero,
          color: whiteColor,
          elevation: elevation,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(curvedRadius)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              AnimatedContainer(duration: const Duration(milliseconds: 500),
                width: double.infinity,
                height: errorText.isEmpty?0:40,
                color: Colors.red,
                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                child:Center(child: Text(errorText,style: textStyle(true, 14, white),)),
              ),
              if(title!=null)Padding(
                padding: EdgeInsets.fromLTRB(20,itemSpacing + 10,20,0),
                child: Text(title, style: textStyle(true, inputDialogStyle.titleTextSize!, titleColor),
                ),
              ),
              addSpace(itemSpacing),
              Flexible(fit: FlexFit.loose,
                child: Scrollbar(
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    itemBuilder: (context, position) {

                      TextEditingController textController = textControllers[position];
                      InputItem inputItem = inputItems[position];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          InputTextField(textController: textController, inputDialogStyle: inputDialogStyle, inputItem: inputItem,
                          marginTop: itemSpacing/2,),
                          inputDialogStyle.inputDesign!=InputDesign.normal
                              ? Container()
                              : addLine(
                              1, blackColor.withOpacity(bestOpacity2), 0, itemSpacing/2,0,itemSpacing/2),

                        ],
                      );
                    },
                    itemCount: inputItems.length,
                    shrinkWrap: true,
                  ),
                ),
              ),

                InputDialogButton(inputDialogStyle: inputDialogStyle,inputDialogModel: inputDialogModel,
                buttonClick: (){

                  List<String> list = [];

                  for(int i=0;i<inputItems.length;i++){
                    TextEditingController textController = textControllers[i];
                    InputItem inputItem = inputItems[i];
                    bool allowEmpty = inputItem.allowEmpty;
                    String text = textController.text.trim();
                    if(text.isEmpty && !allowEmpty){
                      showError("${inputItem.title} cannot be empty");
                      return;
                    }
                    list.add(text);
                  }

                  closePage((){
                    Navigator.pop(context,list);
                  });
                },)
            ],
          ),
        ),
      ),
    );
  }

  closePage(onClosed){
    showBack=false;
    setState(() {

    });
    Future.delayed(const Duration(milliseconds: 300),(){
      Future.delayed(const Duration(milliseconds: 100),(){
        hideUI=true;
        setState(() {});
      });
      onClosed();
    });
  }

  String errorText = "";
  showError(String text){

    errorText=text;
    setState(() {});

    Future.delayed(const Duration(seconds: 1),(){
      errorText="";
      setState(() {});

    });
  }
}
