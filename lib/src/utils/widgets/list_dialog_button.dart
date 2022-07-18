import 'package:dialogpack/src/assets/color_assets.dart';
import 'package:dialogpack/src/models/dialog_button_alignment.dart';
import 'package:dialogpack/src/models/dialog_button_fit.dart';
import 'package:dialogpack/src/models/dialog_button_design.dart';
import 'package:dialogpack/src/models/list_dialog_model.dart';
import 'package:dialogpack/src/models/list_dialog_style.dart';
import 'package:dialogpack/src/utils/style_utils.dart';
import 'package:flutter/material.dart';

class ListDialogButton extends StatefulWidget {
  final ListDialogModel listDialogModel;
  final ListDialogStyle listDialogStyle;
  final Function() buttonClick;
  const ListDialogButton({
    required this.listDialogModel,
    required this.listDialogStyle,
    required this.buttonClick, Key? key}) : super(key: key);

  @override
  ListDialogButtonState createState() => ListDialogButtonState();
}

class ListDialogButtonState extends State<ListDialogButton> {

  late ListDialogModel listDialogModel;
  late ListDialogStyle listDialogStyle;

  @override
  void initState() {
    super.initState();
    listDialogModel = widget.listDialogModel;
    listDialogStyle = widget.listDialogStyle;

  }

  @override
  Widget build(BuildContext context) {

    String? buttonText = listDialogModel.buttonText;
    if(buttonText==null)return Container();

    Color buttonColor = listDialogStyle.buttonColor ?? blackColor;
    Widget buttonWidget = button(text: buttonText,color: buttonColor,onClick: widget.buttonClick);

    DialogButtonAlignment dialogButtonAlignment = listDialogStyle.dialogButtonAlignment!;
    bool alignLeft = dialogButtonAlignment==DialogButtonAlignment.left;
    bool alignCenter = dialogButtonAlignment==DialogButtonAlignment.center;

    return Align(
        alignment: alignLeft?Alignment.topLeft:alignCenter?Alignment.center:Alignment.topRight,
        child: buttonWidget
    );
  }

  Widget button({required String? text,required Color? color, required Function() onClick}){

    DialogButtonDesign dialogButtonDesign = listDialogStyle.dialogButtonDesign!;
    Function buttonStyle =
    dialogButtonDesign == DialogButtonDesign.normal? StyleUtils.buttonStyle1:
    dialogButtonDesign == DialogButtonDesign.filled? StyleUtils.buttonStyle2:
    StyleUtils.buttonStyle3;
    double borderRadius = listDialogStyle.dialogButtonCornerRadius!;
    DialogButtonFit dialogButtonFit = listDialogStyle.dialogButtonFit!;

    if(text==null)return Container();
    return Container(
      height: listDialogStyle.dialogButtonHeight,
      width: dialogButtonFit==DialogButtonFit.stretch?(double.infinity):null,
      margin: EdgeInsets.all(listDialogStyle.buttonSpacing!),
      child: TextButton(onPressed: onClick,
        style: buttonStyle(color:color,borderRadius:borderRadius),
       child: Text(text,style: TextStyle(fontSize: listDialogStyle.dialogButtonTextSize),)
      ),
    );
  }
}
