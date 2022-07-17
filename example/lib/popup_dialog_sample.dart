
 import 'package:dialogpack/dialogpack.dart';
import 'package:flutter/material.dart';

class PopupDialogSample extends StatefulWidget {
  const PopupDialogSample({Key? key}) : super(key: key);

   @override
   PopupDialogSampleState createState() => PopupDialogSampleState();
 }

 class PopupDialogSampleState extends State<PopupDialogSample> {

   double dialogCurveRadius = 0.0;
   double dialogElevation = 0.0;
   DialogPlacement dialogPlacement = DialogPlacement.top;
   DialogEntrance dialogEntrance = DialogEntrance.slide_down;
   double dialogMargin = 0.0;
   double messageTextSize = 18.0;


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    resetStyle();
  }

  void resetStyle(){
    DialogManager.defaultPopupDialogStyle = PopupDialogStyle(
      messageTextSize: messageTextSize,
      dialogStyle: DialogStyle(
        margin: dialogMargin,
        dialogPlacement: dialogPlacement,
        curvedRadius: dialogCurveRadius,
        elevation: dialogElevation,
      ),
    );
  }

   @override
   Widget build(BuildContext context) {

     return Scaffold(
         appBar: AppBar(
           title: const Text('Popup Dialog'),
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
                         DialogManager.showPopupDialog(context,
                         message: "This is a simple popup",dialogEntrance: dialogEntrance);
                       },
                           style: TextButton.styleFrom(
                               primary: Colors.white,backgroundColor: Colors.blue
                           ),
                           child:const Text("Show Dialog 1",)),
                     ),
                     Container(
                       height: 45,
                       margin: const EdgeInsets.all(10),
                       child: TextButton(onPressed: (){
                         DialogManager.showPopupDialog(context,
                           message: "This is a simple popup",icon: Icons.info_outline,
                             dialogEntrance: dialogEntrance,
                         popupDialogStyle: PopupDialogStyle(
                           boxColor: Colors.red,messageTextSize: messageTextSize,
                           dialogStyle: DialogStyle(
                             dialogPlacement: dialogPlacement,elevation: dialogElevation,
                             curvedRadius: dialogCurveRadius,margin: dialogMargin
                           ),
                         ));
                       },
                           style: TextButton.styleFrom(
                               primary: Colors.white,backgroundColor: Colors.blue
                           ),
                           child:const Text("Show Dialog 2",)),
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

                           groupedCheckBox("Message Text Size",messageTextSize, generateNumbers(start: 14, multiplier: 2), (item){
                             setState(() {
                               messageTextSize = double.parse(item.toString());
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
