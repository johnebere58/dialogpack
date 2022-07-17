import 'package:dialogpack/src/assets/color_assets.dart';
import 'package:dialogpack/src/models/dialog_button_alignment.dart';
import 'package:dialogpack/src/models/dialog_button_fit.dart';
import 'package:dialogpack/src/models/dialog_button_design.dart';
import 'package:dialogpack/src/models/input_dialog_model.dart';
import 'package:dialogpack/src/models/input_dialog_style.dart';
import 'package:dialogpack/src/utils/style_utils.dart';
import 'package:flutter/material.dart';

class InputDialogButton extends StatefulWidget {
  final InputDialogModel inputDialogModel;
  final InputDialogStyle inputDialogStyle;
  final Function() buttonClick;
  const InputDialogButton({
    required this.inputDialogModel,
    required this.inputDialogStyle,
    required this.buttonClick, Key? key}) : super(key: key);

  @override
  InputDialogButtonState createState() => InputDialogButtonState();
}

class InputDialogButtonState extends State<InputDialogButton> {

  late InputDialogModel inputDialogModel;
  late InputDialogStyle inputDialogStyle;

  @override
  void initState() {
    super.initState();
    inputDialogModel = widget.inputDialogModel;
    inputDialogStyle = widget.inputDialogStyle;

  }

  @override
  Widget build(BuildContext context) {


    String? buttonText = inputDialogModel.buttonText;
    if(buttonText==null)return Container();

    Color buttonColor = inputDialogStyle.buttonColor ?? blackColor;
    Widget buttonWidget = button(text: buttonText,color: buttonColor,onClick: widget.buttonClick);

    DialogButtonAlignment dialogButtonAlignment = inputDialogStyle.dialogButtonAlignment!;
    bool alignLeft = dialogButtonAlignment==DialogButtonAlignment.left;
    bool alignCenter = dialogButtonAlignment==DialogButtonAlignment.center;

    return Align(
        alignment: alignLeft?Alignment.topLeft:alignCenter?Alignment.center:Alignment.topRight,
        child: buttonWidget
    );
  }

  Widget button({required String? text,required Color? color, required Function() onClick}){

    DialogButtonDesign dialogButtonStyle = inputDialogStyle.dialogButtonStyle!;
    Function buttonStyle =
    dialogButtonStyle == DialogButtonDesign.normal? StyleUtils.buttonStyle1:
    dialogButtonStyle == DialogButtonDesign.filled? StyleUtils.buttonStyle2:
    StyleUtils.buttonStyle3;
    double borderRadius = inputDialogStyle.dialogButtonCornerRadius!;
    DialogButtonFit dialogButtonFit = inputDialogStyle.dialogButtonFit!;

    if(text==null)return Container();
    return Container(
      height: inputDialogStyle.dialogButtonHeight,
      width: dialogButtonFit==DialogButtonFit.stretch?(double.infinity):null,
      margin: EdgeInsets.all(inputDialogStyle.buttonSpacing!),
      child: TextButton(onPressed: onClick,
        style: buttonStyle(color:color,borderRadius:borderRadius),
       child: Text(text,style: TextStyle(fontSize: inputDialogStyle.dialogButtonTextSize),)
      ),
    );
  }
}
