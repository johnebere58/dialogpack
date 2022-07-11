
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
               Text(message,key: const ValueKey("text"),),
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
                       }, returnIndexes: false);

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
                       }, returnIndexes: true);

                 },
                 child: const Text("Click Me for Index"),
               ),

               const SizedBox(height: 10,),
               TextButton(
                 onPressed: (){

                   List<String> items = List.generate(5, (index) => "Item $index");

                   DialogManager.showSimpleListDialog(context,
                       items: items,searchable: true,maxSelections: 3,
                       onItemSelected: (item){
                         setState(() {
                           message = "Items $item";
                         });
                       }, returnIndexes: false);

                 },
                 child: const Text("Click Me for Multiple Items"),
               ),

               const SizedBox(height: 10,),
               TextButton(
                 onPressed: (){

                   List<String> items = List.generate(5, (index) => "Item $index");

                   DialogManager.showSimpleListDialog(context,
                       items: items,searchable: true,maxSelections: 3,
                       onItemSelected: (item){
                         setState(() {
                           message = "Indexes $item";
                         });
                       }, returnIndexes: true);

                 },
                 child: const Text("Click Me for Multiple Indexes"),
               ),


             ],
           ),
         ),
       ),
     );
   }
 }
