
import 'package:dialogpack/dialogpack.dart';
import 'package:dialogpack/src/models/input_item.dart';
import 'package:flutter/material.dart';

class SampleWidgetInputTest extends StatefulWidget {

  const SampleWidgetInputTest({Key? key}):super(key: key);

   @override
   SampleWidgetInputTestState createState() => SampleWidgetInputTestState();
 }

 class SampleWidgetInputTestState extends State<SampleWidgetInputTest> {

  String message = "";

   @override
   Widget build(BuildContext context) {
     List<String> items = List.generate(5, (index) => "Item $index");

     return Scaffold(
       appBar: AppBar(title: const Text("Welcome"),),
       body: Container(
         color: Colors.white,
         child: Center(
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               Text(message,key: const ValueKey("text"),),
               const SizedBox(height: 10,),
               TextButton(
                 onPressed: (){

                   DialogManager.showInputDialog(context, inputItems: [
                     InputItem(title: "Name")
                   ], onSummit: (List<String> items){
                     message = "$items";
                     setState(() {});
                   });

                 },
                 child: const Text("Click Me"),
               ),


             ],
           ),
         ),
       ),
     );
   }
 }
