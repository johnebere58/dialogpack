
 import 'dart:async';

import 'package:dialogpack/src/assets/color_assets.dart';
import 'package:dialogpack/src/blocs/check_box_controller.dart';
import 'package:dialogpack/src/models/check_box_model.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final Function onChecked;
  final String? title;
  final Color? checkColor;
  final Color? textColor;
  final double size;
  final double textSize;
  final bool defaultValue;
  const CustomCheckBox({
    required this.onChecked(bool onChecked),this.title,
    this.size=18.0,
    this.textSize=14.0,
    this.checkColor,
    this.textColor,
    this.defaultValue=false,
    Key? key}) : super(key: key);

  @override
   CustomCheckBoxState createState() => CustomCheckBoxState();
 }

 class CustomCheckBoxState extends State<CustomCheckBox> {

  late StreamSubscription _streamSubscription;
  late bool checked;

  @override
  void initState() {
    checked = widget.defaultValue;
    _streamSubscription = CheckBoxController.instance.stream.listen((CheckBoxModel checkBoxModel) {
      String valueKey = (widget.key as ValueKey).value;
      if(checkBoxModel.id == valueKey){
        checked = checkBoxModel.check;
        if(mounted)setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

   @override
   Widget build(BuildContext context) {

    Color checkColor = widget.checkColor ?? blackColor;
    Color textColor = widget.textColor ?? blackColor;
    double size = widget.size;
    double textSize = widget.textSize;
    String? title = widget.title;

     return GestureDetector(
       onTap: (){
         checked = !checked;
         widget.onChecked(checked);
         setState(() {});

       },

       child: Container(color: Colors.transparent,
         child: Row(
           mainAxisSize: MainAxisSize.min,
           children: [
             Container(
               padding: const EdgeInsets.all(2),
               decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color: checked?Colors.transparent: blackColor.withOpacity(bestOpacity3),
                   border:
                   Border.all(color:checkColor, width: 1.5)
               ),
               child: AnimatedContainer(duration: const Duration(milliseconds: 600),
                 width: size,
                 height: size,
                 margin: const EdgeInsets.all(.5),
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color: checked ? checkColor : transparent,
                 ),
                 child: Icon(
                   Icons.check,
                   size: size-4,
                   color: !checked?transparent:whiteColor,
                 ),
               ),
             ),
             if(title!=null)Container(
               margin: const EdgeInsets.only(left: 5),
               child: Text(title,
                 style: TextStyle(fontSize: textSize,color: textColor),),
             )
           ],
         ),
       ),
     );
   }


 }
