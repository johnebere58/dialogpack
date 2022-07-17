import 'package:dialogpack/src/assets/color_assets.dart';
import 'package:dialogpack/src/models/input_design.dart';
import 'package:dialogpack/src/models/input_dialog_style.dart';
import 'package:dialogpack/src/models/input_item.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  final TextEditingController textController;
  final FocusNode? focusNode;
  final InputItem inputItem;
  final InputDialogStyle inputDialogStyle;
  final double marginTop;
  final double marginBottom;

  const InputTextField(
  {
    required this.textController,
    required this.inputDialogStyle,
    required this.inputItem,
    this.focusNode,
    this.marginTop=0,
    this.marginBottom=0,
    Key? key}):super(key: key);
  @override
  InputTextFieldState createState() => InputTextFieldState();
}

class InputTextFieldState extends State<InputTextField> {

  late FocusNode focusNode;
  late TextEditingController textController;
  late InputItem inputItem;
  late InputDialogStyle inputDialogStyle;
  bool showPass = false;
  bool loading = false;
  @override
  void initState() {
    textController = widget.textController;
    inputItem = widget.inputItem;
    inputDialogStyle = widget.inputDialogStyle;
    focusNode = widget.focusNode??FocusNode();
    focusNode.addListener(() {
      if(mounted)setState(() {});
    });
    super.initState();
  }

  // @override
  // void dispose() {
  //   focusNode.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body() {
    bool focused = focusNode.hasFocus;
    String title = inputItem.title;
    String? hint = inputItem.hint;
    String? image = inputItem.image;
    IconData? icon = inputItem.icon;
    Color titleColor = inputItem.titleColor ?? blackColor;
    Color hintColor = inputItem.hintColor ?? blackColor.withOpacity(.5);
    Color iconOrImageColor = inputItem.iconOrImageColor ?? blackColor.withOpacity(.5);
    Color textColor = inputItem.textColor ?? blackColor;
    Color inputFocusedColor = inputDialogStyle.inputFocusedColor!;
    bool obscure = inputItem.obscure;
    TextInputType inputType = inputItem.inputType;
    int maxLine = inputItem.maxLine;
    int? maxLength = inputItem.maxLength;
    double? textBoxHeight = inputItem.textBoxHeight;
    double fontSize = inputItem.fontSize;
    // bool allowEmpty = inputItem.allowEmpty;
    TextInputAction textInputAction = inputItem.textInputAction;
    TextCapitalization textCapitalization = inputItem.textCapitalization;
    InputDesign? inputDesign = inputDialogStyle.inputDesign;

    double cornerRadius = inputDialogStyle.inputCornerRadius!;
    bool isFilled = inputDesign==InputDesign.filled;
    bool isStroked = inputDesign==InputDesign.stroked;
    bool isNormal = inputDesign==InputDesign.normal;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: textBoxHeight,
      margin: EdgeInsets.fromLTRB(
          0,
          textBoxHeight==0?0:widget.marginTop,
          0,
          textBoxHeight==0?0:widget.marginBottom),
      decoration: BoxDecoration(
        color: isFilled? whiteColor3 : Colors.transparent,
        borderRadius: BorderRadius.circular(cornerRadius),
        border:
        focused?Border.all(color: inputFocusedColor,width: 2):
        isStroked?Border.all(
          width: 1.5, color: whiteColor3
        ):null
      ),
      padding: isNormal?EdgeInsets.zero:const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Row(
        children: [
          Flexible(fit: FlexFit.tight,
            child: TextField(key: ValueKey(inputItem.itemKey),
              controller: widget.textController,
              keyboardType:
              maxLine>3?TextInputType.multiline:
              inputType,
              textCapitalization: textCapitalization,
              textInputAction:
              maxLine>3?TextInputAction.newline:
              textInputAction,
              focusNode: focusNode,
            //   onSubmitted: (s,){
            //   if(widget.onSubmit!=null)widget.onSubmit(s);
            // },
              decoration: InputDecoration(
                isDense: true,prefixIconConstraints:
              textBoxHeight==null?null:
              BoxConstraints(
                maxWidth: textBoxHeight,maxHeight: textBoxHeight/2,
              ),
                counter: textBoxHeight!=null?null:Container(),
                prefixIcon:
                textBoxHeight==0?null:
                image != null ? (
                    Image.asset(image,
                      color: focused ? inputFocusedColor : iconOrImageColor,)
                ) :
                icon !=null?
                Icon(
                  icon,
                  color: focused ? inputFocusedColor : iconOrImageColor,
                ):null,

                suffix:
                !obscure?null:GestureDetector(
                    onTap: () {
                    showPass = !showPass;
                    setState(() {});},
                    child: Text(
                      showPass ? "HIDE" : "SHOW",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize/(.8), color: blackColor.withOpacity(.5)),
                    )),
                labelStyle: TextStyle(
                  fontSize: 16, color:focused ? inputFocusedColor : titleColor,
                ),
                labelText: title,
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: 16, color: hintColor,
                ),
                // focusedBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(widget.curved?35:5),
                //     borderSide: BorderSide(color:  (widget.useWhite?white:red0), width: 2)),
                // enabledBorder: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(widget.curved?35:5),
                //     borderSide: BorderSide(
                //         color: widget.height==0?transparent: widget.useWhite?white: theColor.withOpacity(.35), width: 1)),
              ),
              style: TextStyle(
                  fontSize: fontSize,
                  color:textColor
              ),
              obscureText:obscure && !showPass,
              onChanged: (s){
              setState(() {});
            },
              cursorColor: textColor,
              cursorWidth: 1,
              maxLines: maxLine > 1 ? null : maxLine,
              maxLength: maxLength,

            ),
          ),
          if(loading)Container(
              margin: const EdgeInsets.only(left: 10),
              width: 12,height: 12,
              child:const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.black),
                strokeWidth: 2,
              ))
        ],
      ),
    );
  }
}
