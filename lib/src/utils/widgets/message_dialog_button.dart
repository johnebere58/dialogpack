import 'package:dialogpack/src/models/button_placement.dart';
import 'package:dialogpack/src/models/dialog_button_alignment.dart';
import 'package:dialogpack/src/models/dialog_button_fit.dart';
import 'package:dialogpack/src/models/dialog_button_style.dart';
import 'package:dialogpack/src/models/message_dialog_model.dart';
import 'package:dialogpack/src/models/message_dialog_style.dart';
import 'package:dialogpack/src/utils/style_utils.dart';
import 'package:flutter/material.dart';

class MessageDialogButton extends StatefulWidget {
  final MessageDialogModel messageDialogModel;
  final MessageDialogStyle messageDialogStyle;
  final Function() positiveButtonClick;
  final Function() negativeButtonClick;
  final Function() neutralButtonClick;
  const MessageDialogButton({
    required this.messageDialogModel,
    required this.messageDialogStyle,
    required this.positiveButtonClick,
    required this.negativeButtonClick,
    required this.neutralButtonClick, Key? key}) : super(key: key);

  @override
  MessageDialogButtonState createState() => MessageDialogButtonState();
}

class MessageDialogButtonState extends State<MessageDialogButton> {

  late MessageDialogModel messageDialogModel;
  late MessageDialogStyle messageDialogStyle;

  @override
  void initState() {
    super.initState();
    messageDialogModel = widget.messageDialogModel;
    messageDialogStyle = widget.messageDialogStyle;

  }

  @override
  Widget build(BuildContext context) {

    ButtonPlacement buttonPlacement = messageDialogStyle.buttonPlacement!;
    String positiveText = messageDialogModel.positiveClickText;
    String? negativeText = messageDialogModel.negativeClickText;
    String? neutralText = messageDialogModel.neutralClickText;


    Color positiveTextButtonColor = messageDialogStyle.positiveTextButtonColor!;
    Color negativeTextButtonColor = messageDialogStyle.negativeTextButtonColor!;
    Color neutralTextButtonColor = messageDialogStyle.neutralTextButtonColor!;

    Widget positiveButton = button(text: positiveText,color: positiveTextButtonColor,onClick: widget.positiveButtonClick);
    Widget negativeButton = button(text: negativeText,color: negativeTextButtonColor,onClick: widget.negativeButtonClick);
    Widget neutralButton = button(text: neutralText,color: neutralTextButtonColor,onClick: widget.neutralButtonClick);

    DialogButtonAlignment dialogButtonAlignment = messageDialogStyle.dialogButtonAlignment!;
    bool alignLeft = dialogButtonAlignment==DialogButtonAlignment.left;
    bool alignCenter = dialogButtonAlignment==DialogButtonAlignment.center;
    // bool alignRight = dialogButtonAlignment==DialogButtonAlignment.right;

    if(buttonPlacement==ButtonPlacement.wrapped) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: alignLeft?CrossAxisAlignment.start:alignCenter?CrossAxisAlignment.center:CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: positiveButton),
              if(negativeText != null)Flexible(
                  child: negativeButton),
            ],
          ),
          if(neutralText != null)neutralButton
        ],
      );
    }
    if(buttonPlacement==ButtonPlacement.row) {
      return Align(
        alignment: alignLeft?Alignment.topLeft:alignCenter?Alignment.center:Alignment.topRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                child: positiveButton),
            if(negativeText != null)Flexible(
                child: negativeButton),
            if(neutralText != null)Flexible(
                child: neutralButton),

          ],
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: alignLeft?CrossAxisAlignment.start:alignCenter?CrossAxisAlignment.center:CrossAxisAlignment.end,
      children: [
        positiveButton,
        if(negativeText!=null)negativeButton,
        if(neutralText!=null)neutralButton
      ],
    );
  }

  Widget button({required String? text,required Color? color, required Function() onClick}){

    DialogButtonStyle dialogButtonStyle = messageDialogStyle.dialogButtonStyle!;
    Function buttonStyle =
    dialogButtonStyle == DialogButtonStyle.normal? StyleUtils.buttonStyle1:
    dialogButtonStyle == DialogButtonStyle.filled? StyleUtils.buttonStyle2:
    StyleUtils.buttonStyle3;
    double borderRadius = messageDialogStyle.dialogButtonCornerRadius!;
    DialogButtonFit dialogButtonFit = messageDialogStyle.dialogButtonFit!;

    if(text==null)return Container();
    return Container(
      height: 50,
      width: dialogButtonFit==DialogButtonFit.stretch?(double.infinity):null,
      margin: EdgeInsets.all(messageDialogStyle.buttonSpacing!),
      child: TextButton(onPressed: onClick,
        style: buttonStyle(color:color,borderRadius:borderRadius),
       child: Text(text,style: TextStyle(fontSize: messageDialogStyle.dialogButtonTextSize),)
      ),
    );
  }
}
