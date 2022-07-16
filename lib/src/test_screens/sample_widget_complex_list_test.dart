
import 'package:dialogpack/dialogpack.dart';
import 'package:dialogpack/src/models/list_dialog_model.dart';
import 'package:dialogpack/src/models/list_item.dart';
import 'package:flutter/material.dart';

class SampleWidgetComplexListTest extends StatefulWidget {

  const SampleWidgetComplexListTest({Key? key}):super(key: key);

   @override
   SampleWidgetComplexListTestState createState() => SampleWidgetComplexListTestState();
 }

 class SampleWidgetComplexListTestState extends State<SampleWidgetComplexListTest> {

  String message = "";

   @override
   Widget build(BuildContext context) {
     List<ListItem> items = List.generate(5, (index) => ListItem(title: "Item $index"));

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

                   DialogManager.showComplexListDialog(context,
                       listDialogModel: ListDialogModel(listItems: items,searchable: true),
                       onItemSelected: (item){
                         setState(() {
                           message = "${item.title}";
                         });
                       }, returnIndexes: false);

                 },
                 child: const Text("Click Me"),
               ),
               const SizedBox(height: 10,),
               TextButton(
                 onPressed: (){

                   DialogManager.showComplexListDialog(context,
                       listDialogModel: ListDialogModel(listItems: items,searchable: true),
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

                   DialogManager.showComplexListDialog(context,
                       listDialogModel: ListDialogModel(listItems: items,searchable: true,maxSelection: 3),
                       onItemSelected: (item){
                         setState(() {
                           message = "Items ${List.generate(item.length, (index) => item[index].title)}";
                         });
                       }, returnIndexes: false);

                 },
                 child: const Text("Click Me for Multiple Items"),
               ),

               const SizedBox(height: 10,),
               TextButton(
                 onPressed: (){

                   DialogManager.showComplexListDialog(context,
                       listDialogModel: ListDialogModel(listItems: items,searchable: true,maxSelection: 3),
                       onItemSelected: (item){
                         setState(() {
                           message = "Indexes $item";
                         });
                       }, returnIndexes: true);

                 },
                 child: const Text("Click Me for Multiple Indexes"),
               )

             ],
           ),
         ),
       ),
     );
   }
 }
