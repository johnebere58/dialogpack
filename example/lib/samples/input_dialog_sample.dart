
 import 'package:dialogpack/dialogpack.dart';
import 'package:flutter/material.dart';

class InputDialogSample extends StatefulWidget {
  const InputDialogSample({Key? key}) : super(key: key);

   @override
   _InputDialogSampleState createState() => _InputDialogSampleState();
 }

 class _InputDialogSampleState extends State<InputDialogSample> {

   bool useDarkMode = false;
   bool showTitle = false;

   double dialogCurveRadius = 20.0;
   double dialogElevation = 5.0;
   DialogPlacement dialogPlacement = DialogPlacement.center;
   DialogEntrance dialogEntrance = DialogEntrance.scale;
   double dialogMargin = 40.0;
   double titleTextSize = 20.0;
   double itemSpacing = 15;
   bool showDivider = true;
   DialogButtonDesign dialogButtonDesign = DialogButtonDesign.normal;
   DialogButtonFit dialogButtonFit = DialogButtonFit.normal;
   DialogButtonAlignment dialogButtonAlignment = DialogButtonAlignment.center;
   double dialogButtonSpacing = 15.0;
   double dialogButtonTextSize = 18.0;
   double dialogButtonCornerRadius = 5.0;
   double dialogButtonHeight = 45.0;
   double inputCornerRadius = 5.0;
   InputDesign inputDesign = InputDesign.normal;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    useDarkMode = DialogManager.darkMode;
    resetStyle();
  }

   void resetStyle(){
     DialogManager.defaultInputDialogStyle = InputDialogStyle(
       titleTextSize: titleTextSize,
       showButtonDivider: showDivider,
       itemSpacing: itemSpacing,

       dialogStyle: DialogStyle(
         margin: dialogMargin,
         dialogPlacement: dialogPlacement,
         curvedRadius: dialogCurveRadius,
         // appBanner: ,
         elevation: dialogElevation,
       ),
       dialogButtonDesign: dialogButtonDesign,
       dialogButtonFit: dialogButtonFit,
       dialogButtonAlignment: dialogButtonAlignment,
       buttonSpacing: dialogButtonSpacing,
       dialogButtonTextSize: dialogButtonTextSize,
       dialogButtonCornerRadius: dialogButtonCornerRadius,
       dialogButtonHeight: dialogButtonHeight,
       inputCornerRadius: inputCornerRadius,
       inputDesign: inputDesign
     );
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(
           title: const Text('Input Dialog'),
         ),
         backgroundColor: Colors.white,
         body: Column(
           children: [
             SingleChildScrollView(scrollDirection: Axis.horizontal,
               child: Row(
                 children: [
                   Container(
                     height: 40,
                     // width: double.infinity,
                     margin: const EdgeInsets.all(10),
                     child: TextButton(onPressed: (){

                       DialogManager.showInputDialog(context, inputItems: [
                         InputItem(title: "Name",hint: "Enter your name"),
                         InputItem(title: "Age",hint: "Enter your age",inputType: TextInputType.number),
                       ], onSummit: (_){
                         showSnackBar(_);
                       },title: showTitle?"Personal Info":null);

                     },
                         style: TextButton.styleFrom(
                             backgroundColor: Colors.blue
                         ),
                         child: const Text("Show Input Dialog 1",
                           style: TextStyle(color: Colors.white,fontSize: 16),)),
                   ),

                   Container(
                     height: 40,
                     // width: double.infinity,
                     margin: const EdgeInsets.all(10),

                     child: TextButton(onPressed: (){
                       DialogManager.showInputDialog(context, inputItems: [
                         InputItem(title: "Name",hint: "Enter your name",icon: Icons.person_outline),
                         InputItem(title: "Age",hint: "Enter your age",inputType: TextInputType.number, icon: Icons.numbers),
                       ], onSummit: (_){
                         showSnackBar(_);
                       },title: showTitle?"Personal Info":null);

                     },
                         style: TextButton.styleFrom(
                             backgroundColor: Colors.blue
                         ),
                         child: const Text("Show Input Dialog 2",
                           style: TextStyle(color: Colors.white,fontSize: 16),)),
                   ),



                 ],
               ),
             ),
             Expanded(
               child: SingleChildScrollView(
                 child: Column(
                   children: [
                     Container(
                       width: double.infinity,
                       padding: const EdgeInsets.all(10),
                       margin: const EdgeInsets.fromLTRB(15,15,15,0),
                       color: Colors.black.withOpacity(.05),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           const Center(
                             child: Text("Default Style",style: TextStyle(
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
                           const SizedBox(height: 15,),
                           checkButton(showTitle, "Show Title", () {
                             setState(() {
                               showTitle = !showTitle;
                             });
                           }
                           ),
                           const SizedBox(height: 15,),

                           checkButton(showDivider, "Show Divider", (){
                             setState(() {
                               showDivider = !showDivider;
                             });
                             resetStyle();
                           }),
                           const SizedBox(height: 15,),

                           groupedCheckBox("Title Text Size",titleTextSize, generateNumbers(start: 14, multiplier: 2), (item){
                             setState(() {
                               titleTextSize = double.parse(item.toString());
                             });
                           }),

                           groupedCheckBox("Input Corner Radius",inputCornerRadius,
                               generateNumbers(start: 0, multiplier: 5), (item){
                                 setState(() {
                                   inputCornerRadius = double.parse(item.toString());
                                 });
                               }),

                           groupedCheckBox("Item Spacing",itemSpacing, generateNumbers(start: 15, multiplier: 5), (item){
                             setState(() {
                               itemSpacing = double.parse(item.toString());
                             });
                           }),

                           groupedCheckBox("Input Design",
                               InputDesign.values.indexOf(inputDesign),
                               ["Normal","Filled","Stroked"], (item){
                                 setState(() {
                                   inputDesign = InputDesign.values[item];
                                 });
                               },returnIndex: true),



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
                             child:  Text("Button Style",style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontSize: 22
                             ),),
                           ),
                           const SizedBox(height: 15,),

                           groupedCheckBox("Style",
                               DialogButtonDesign.values.indexOf(dialogButtonDesign),
                               ["Normal","Filled","Stroked"], (item){
                                 setState(() {
                                   dialogButtonDesign = DialogButtonDesign.values[item];
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
 }
