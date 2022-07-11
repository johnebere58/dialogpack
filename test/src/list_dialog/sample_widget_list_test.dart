
import 'package:dialogpack/dialogpack.dart';
import 'package:flutter/material.dart';

class SampleWidgetListTest extends StatefulWidget {

  const SampleWidgetListTest({Key? key}):super(key: key);

   @override
   SampleWidgetListTestState createState() => SampleWidgetListTestState();
 }

 class SampleWidgetListTestState extends State<SampleWidgetListTest> {

  String message = "";

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(title: const Text("Welcome"),),
       body: Container(
         color: Colors.white,
         child: Center(
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               Text(message),
               const SizedBox(height: 10,),
               TextButton(
                 onPressed: (){

                   List<String> items = List.generate(5, (index) => "Item $index");

                   DialogManager.showSimpleListDialog(context,
                       items: items,searchable: true,
                       onItemSelected: (item){
                         setState(() {
                           message = "$item";
                         });
                       }, returnIndex: false);

                 },
                 child: const Text("Click Me"),
               ),
               const SizedBox(height: 10,),
               TextButton(
                 onPressed: (){

                   List<String> items = List.generate(5, (index) => "Item $index");

                   DialogManager.showSimpleListDialog(context,
                       items: items,searchable: true,
                       onItemSelected: (item){
                         setState(() {
                           message = "Index $item";
                         });
                       }, returnIndex: true);

                 },
                 child: const Text("Click Me for Index"),
               ),

             ],
           ),
         ),
       ),
     );
   }
 }
