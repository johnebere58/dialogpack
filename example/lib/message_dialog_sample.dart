
 import 'package:dialogpack/dialogpack.dart';
import 'package:flutter/material.dart';

class MessageDialogSample extends StatefulWidget {
  const MessageDialogSample({Key? key}) : super(key: key);

   @override
   MessageDialogSampleState createState() => MessageDialogSampleState();
 }

 class MessageDialogSampleState extends State<MessageDialogSample> {

   bool useDarkMode = false;
   bool showNegativeButton = false;
   bool showNeutralButton = false;

   // bool showAppBanner = false;
   double dialogCurveRadius = 20.0;
   double dialogElevation = 5.0;
   DialogPlacement dialogPlacement = DialogPlacement.center;
   DialogEntrance dialogEntrance = DialogEntrance.scale;
   double dialogMargin = 40.0;
   double titleTextSize = 20.0;
   double messageTextSize = 20.0;
   double itemSpacing = 15.0;
   bool showDivider = false;
   ImageOrIconPlacement imageOrIconPlacement = ImageOrIconPlacement.normal;
   double imageOrIconSize = 60.0;
   double imageOrIconPadding = 0.0;
   double imageOrIconMargin = 5.0;
   DialogButtonDesign dialogButtonStyle = DialogButtonDesign.normal;
   DialogButtonFit dialogButtonFit = DialogButtonFit.normal;
   DialogButtonAlignment dialogButtonAlignment = DialogButtonAlignment.center;
   double dialogButtonSpacing = 5.0;
   double dialogButtonTextSize = 18.0;
   ButtonPlacement buttonPlacement = ButtonPlacement.wrapped;
   double dialogButtonCornerRadius = 5.0;
   double dialogButtonHeight = 45.0;


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // resetStyle();
  }

  void resetStyle(){
    DialogManager.defaultMessageDialogStyle = MessageDialogStyle(
      titleTextSize: titleTextSize,
      // titleTextColor: ,
      showButtonDivider: showDivider,
      // positiveTextButtonColor: ,
      // neutralTextButtonColor: ,
      // negativeTextButtonColor: ,
      messageTextSize: messageTextSize,
      itemSpacing: itemSpacing,
      // messageTextColor: ,
      imageOrIconStyle: ImageOrIconStyle(
        imageOrIconPlacement:imageOrIconPlacement,
        size: imageOrIconSize,
        padding: imageOrIconPadding,
        // color: ,
        margin: imageOrIconMargin,
      ),
      dialogStyle: DialogStyle(
        margin: dialogMargin,
        dialogPlacement: dialogPlacement,
        curvedRadius: dialogCurveRadius,
        // appBanner: ,
        elevation: dialogElevation,
      ),
      dialogButtonStyle: dialogButtonStyle,
      dialogButtonFit: dialogButtonFit,
      dialogButtonAlignment: dialogButtonAlignment,
      buttonSpacing: dialogButtonSpacing,
      dialogButtonTextSize: dialogButtonTextSize,
      buttonPlacement: buttonPlacement,
      dialogButtonCornerRadius: dialogButtonCornerRadius,
      dialogButtonHeight: dialogButtonHeight,
    );
  }

   @override
   Widget build(BuildContext context) {

     return Scaffold(
         appBar: AppBar(
           title: const Text('Message Dialog'),
         ),
         backgroundColor: Colors.white,
         body: Column(
           children: [
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               child: Row(
                   children: [
                     Container(
                       height: 45,
                       margin: const EdgeInsets.all(10),
                       child: TextButton(onPressed: (){
                         // showMessageDialog();
                         DialogManager.showMessageDialog(context, messageDialogModel: MessageDialogModel(message: "Hello John"));
                       },
                           style: TextButton.styleFrom(
                               primary: Colors.white,backgroundColor: Colors.blue
                           ),
                           child:const Text("Show Dialog",)),
                     ),
                     Container(
                       height: 45,
                       margin: const EdgeInsets.all(10),
                       child: TextButton(onPressed: (){
                         showMessageDialog(withImage:true);
                       },
                           style: TextButton.styleFrom(
                               primary: Colors.white,backgroundColor: Colors.blue
                           ),
                           child:const Text("Show Dialog With Image",)),
                     ),
                     Container(
                       height: 45,
                       margin: const EdgeInsets.all(10),
                       child: TextButton(onPressed: (){
                         DialogManager.showYesNoDialog(context, message: "Are you sure you are happy?", clickedYes: (){
                           showSnackBar("Clicked Yes");
                         },clickedNo: (){
                           showSnackBar("Clicked No");
                         });
                       },
                           style: TextButton.styleFrom(
                               primary: Colors.white,backgroundColor: Colors.blue
                           ),
                           child:const Text("Show Yes/No Dialog",)),
                     ),
                     Container(
                       height: 45,
                       margin: const EdgeInsets.all(10),
                       child: TextButton(onPressed: (){
                         DialogManager.showSuccessDialog(context,
                             message: "Your image uploaded successfully", clickedYes: (){
                               showSnackBar("Clicked Ok");
                             });
                       },
                           style: TextButton.styleFrom(
                               primary: Colors.white,backgroundColor: Colors.blue
                           ),
                           child:const Text("Show Success Dialog",)),
                     ),
                     Container(
                       height: 45,
                       margin: const EdgeInsets.all(10),
                       child: TextButton(onPressed: (){
                         DialogManager.showFailedDialog(context,
                             message: "Your image failed to upload", clickedYes: (){
                               showSnackBar("Clicked Ok");
                             });
                       },
                           style: TextButton.styleFrom(
                               primary: Colors.white,backgroundColor: Colors.blue
                           ),
                           child:const Text("Show Failed Dialog",)),
                     ),

                   ]
               ),
             ),
             Expanded(
               child: SingleChildScrollView(
                 child: Column(
                   children: [
                     Container(
                       width: double.infinity,
                       padding: const EdgeInsets.all(10),
                       margin: const EdgeInsets.fromLTRB(15,15,15,15),
                       color: Colors.black.withOpacity(.05),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                          const Center(
                             child:  Text("Default Style",style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 22
                             ),),
                           ),
                           const SizedBox(height: 15,),

                           checkButton(useDarkMode, "Use Dark Mode", (){
                             setState(() {
                               useDarkMode = !useDarkMode;
                               if(useDarkMode)DialogManager.switchToDarkMode();
                               if(!useDarkMode)DialogManager.switchToLightMode();
                             });
                           }),
                           const SizedBox(height: 10,),
                           checkButton(showNegativeButton, "Show Negative Button", (){
                             setState(() {
                               showNegativeButton = !showNegativeButton;
                             });
                           }),
                           const SizedBox(height: 15,),
                           checkButton(showNeutralButton, "Show Neutral Button", (){
                             setState(() {
                               showNeutralButton = !showNeutralButton;
                             });
                           }),
                           const SizedBox(height: 15,),
                           checkButton(showDivider, "Show Divider", (){
                             setState(() {
                               showDivider = !showDivider;
                             });
                             resetStyle();
                           }),

                           groupedCheckBox("Title Text Size",titleTextSize, generateNumbers(start: 14, multiplier: 2), (item){
                             setState(() {
                               titleTextSize = double.parse(item.toString());
                             });
                           }),

                           groupedCheckBox("Message Text Size",messageTextSize, generateNumbers(start: 14, multiplier: 2), (item){
                             setState(() {
                               messageTextSize = double.parse(item.toString());
                             });
                           }),

                           groupedCheckBox("Item Spacing",itemSpacing, generateNumbers(start: 15, multiplier: 5), (item){
                             setState(() {
                               itemSpacing = double.parse(item.toString());
                             });
                           }),
                         ],
                       ),
                     ),

                     Container(
                       width: double.infinity,
                       padding: const EdgeInsets.all(10),
                       margin: const EdgeInsets.fromLTRB(15,15,15,15),
                       color: Colors.black.withOpacity(.05),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                            const Center(
                              child: Text("Dialog Box Style",style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 22
                           ),),
                            ),
                           const SizedBox(height: 15,),

                           groupedCheckBox("Entrance",
                               DialogEntrance.values.indexOf(dialogEntrance),
                               ["Slide Up","Scale","Slide Left","Fade In","Slide Down","Slide Right"], (item){
                                 setState(() {
                                   dialogEntrance = DialogEntrance.values[item];
                                 });
                                 DialogManager.defaultEntrance = dialogEntrance;
                               },returnIndex: true),

                           groupedCheckBox("Curve Radius",dialogCurveRadius, generateNumbers(start: 0, multiplier: 5), (item){
                             setState(() {
                               dialogCurveRadius = double.parse(item.toString());
                             });
                           }),

                           groupedCheckBox("Elevation",dialogElevation, generateNumbers(start: 0, multiplier: 5), (item){
                             setState(() {
                               dialogElevation = double.parse(item.toString());
                             });
                           }),

                           groupedCheckBox("Placement",
                               DialogPlacement.values.indexOf(dialogPlacement),
                               ["Top","Center","Bottom"], (item){
                             setState(() {
                               dialogPlacement = DialogPlacement.values[item];
                             });
                           },returnIndex: true),


                           groupedCheckBox("Margin",dialogMargin, generateNumbers(start: 0, multiplier: 10), (item){
                             setState(() {
                               dialogMargin = double.parse(item.toString());
                             });
                           }),
                         ],
                       ),
                     ),

                     Container(
                       width: double.infinity,
                       padding: const EdgeInsets.all(10),
                       margin: const EdgeInsets.fromLTRB(15,15,15,15),
                       color: Colors.black.withOpacity(.05),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           const Center(
                             child: Text("Dialog Image/Icon Style",style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 22
                             ),),
                           ),
                           const SizedBox(height: 15,),

                           groupedCheckBox("Image/Icon Placement",
                               ImageOrIconPlacement.values.indexOf(imageOrIconPlacement), ["Normal","Top"], (item){
                             setState(() {
                               imageOrIconPlacement = ImageOrIconPlacement.values[item];
                             });
                           },returnIndex: true),

                           groupedCheckBox("Image/Icon Size",imageOrIconSize, generateNumbers(start: 20, multiplier: 10), (item){
                             setState(() {
                               imageOrIconSize = double.parse(item.toString());
                             });
                           }),
                           groupedCheckBox("Image/Icon Padding",imageOrIconPadding, generateNumbers(start: 0, multiplier: 5), (item){
                             setState(() {
                               imageOrIconPadding = double.parse(item.toString());
                             });
                           }),

                           groupedCheckBox("Image/Icon Margin",imageOrIconMargin, generateNumbers(start: 0, multiplier: 5), (item){
                             setState(() {
                               imageOrIconMargin = double.parse(item.toString());
                             });
                           }),
                         ],
                       ),
                     ),

                     Container(
                       width: double.infinity,
                       padding: const EdgeInsets.all(10),
                       margin: const EdgeInsets.fromLTRB(15,15,15,15),
                       color: Colors.black.withOpacity(.05),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                          const Center(
                             child:  Text("Button Style",style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 22
                             ),),
                           ),
                           const SizedBox(height: 15,),

                           groupedCheckBox("Style",
                               DialogButtonDesign.values.indexOf(dialogButtonStyle),
                               ["Normal","Filled","Stroked"], (item){
                             setState(() {
                               dialogButtonStyle = DialogButtonDesign.values[item];
                             });
                           },returnIndex: true),

                           groupedCheckBox("Fit",DialogButtonFit.values.indexOf(dialogButtonFit),
                               ["Normal","Stretched"], (item){
                             setState(() {
                               dialogButtonFit = DialogButtonFit.values[item];
                             });
                           },returnIndex: true),

                           groupedCheckBox("Alignment",
                               DialogButtonAlignment.values.indexOf(dialogButtonAlignment),
                               ["Left","Center","Right"], (item){
                             setState(() {
                               dialogButtonAlignment = DialogButtonAlignment.values[item];
                             });
                           },returnIndex: true),

                           groupedCheckBox("Placement",ButtonPlacement.values.indexOf(buttonPlacement),
                               ["Wrapped","Row","Column"], (item){
                             setState(() {
                               buttonPlacement = ButtonPlacement.values[item];
                             });
                           },returnIndex: true),

                           groupedCheckBox("Spacing",dialogButtonSpacing,
                               generateNumbers(start: 0, multiplier: 3), (item){
                             setState(() {
                               dialogButtonSpacing = double.parse(item.toString());
                             });
                           }),

                           groupedCheckBox("TextSize",dialogButtonTextSize,
                               generateNumbers(start: 14, multiplier: 2), (item){
                             setState(() {
                               dialogButtonTextSize = double.parse(item.toString());
                             });
                           }),

                           groupedCheckBox("Corner Radius",dialogButtonCornerRadius,
                               generateNumbers(start: 0, multiplier: 5), (item){
                             setState(() {
                               dialogButtonCornerRadius = double.parse(item.toString());
                             });
                           }),
                           groupedCheckBox("Height",dialogButtonHeight,
                               generateNumbers(start: 35, multiplier: 5), (item){
                             setState(() {
                               dialogButtonHeight = double.parse(item.toString());
                             });
                           }),


                         ],
                       ),
                     ),


                   ],
                 ),
               ),
             ),
           ],
         )
       // This trailing comma makes auto-formatting nicer for build methods.
     );
   }

   Widget checkButton(bool defaultValue,String text,Function() onChecked){
     return GestureDetector(
       onTap: (){
         onChecked();
         Future.delayed(const Duration(milliseconds: 500),(){
           resetStyle();
         });
       },
       child: Container(color: Colors.transparent,
         // margin: const EdgeInsets.only(bottom: 10),
         child: Row(
           mainAxisSize: MainAxisSize.min,
           children: [
             SizedBox(
               width: 20,height: 20,
               child: Checkbox(value: defaultValue, onChanged: (b){
                 onChecked();
               },),
             ),
             const SizedBox(width: 10,),
             Text(text)
           ],
         ),
       ),
     );
   }

   Widget groupedCheckBox(String title, defaultValue,List items,
       Function(dynamic item) onItemSelected,{bool returnIndex=false}){

     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         const SizedBox(height: 10,),
         Text(title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
         const SizedBox(height: 10,),
         Wrap(
           children: List.generate(items.length, (index){
             var item = items[index];
             bool selected = (returnIndex?items[defaultValue]:defaultValue)==item;
             return Container(
               margin: const EdgeInsets.only(right: 10),
               child: checkButton(selected, "$item", () {
                 onItemSelected(returnIndex?index:items[index]);
                 resetStyle();
               }),
             );
           }),
         ),
       ],
     );
   }

   void showSnackBar(var text){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$text"),
       duration: const Duration(seconds: 1),),);
   }

   List generateNumbers({required int start, required int multiplier, int size=6}){
     return List.generate(size, (index) => start+(index*multiplier));
   }

   void showMessageDialog({bool withImage=false}){
     DialogManager.showMessageDialog(context,
         messageDialogModel:
         MessageDialogModel(title: "Welcome",
             message: "This is a sample message dialog and this is the little gift we have to offer",
             onPositiveClicked: (){
               showSnackBar("Clicked Yes");
             },
             onNegativeClicked: (){
               showSnackBar("Clicked No");
             },
             onNeutralClicked: (){
               showSnackBar("Clicked Maybe");
             },
             positiveClickText: "Yes, Agree",
             negativeClickText: showNegativeButton?"No, Ignore":null,
             neutralClickText: showNeutralButton?"Maybe, Later":null,
         assetImage: withImage?"assets/avatar.png":null));

   }
 }
