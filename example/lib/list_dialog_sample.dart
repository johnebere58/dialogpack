
 import 'package:dialogpack/dialogpack.dart';
import 'package:flutter/material.dart';

class ListDialogSample extends StatefulWidget {
   @override
   _ListDialogSampleState createState() => _ListDialogSampleState();
 }

 class _ListDialogSampleState extends State<ListDialogSample> {

   bool useDarkMode = false;
   bool searchalble = false;
   bool multipleseclection = false;
   bool returnIndex = false;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(
           title: const Text('Message Dialog'),
         ),
         backgroundColor: Colors.white,
         body: SingleChildScrollView(
           child: Column(
             children: [
               Container(
                 padding: const EdgeInsets.all(10),
                 margin: const EdgeInsets.fromLTRB(15,15,15,0),
                 color: Colors.black.withOpacity(.05),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     const Text("List Dialog",style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 22
                     ),),
                     const SizedBox(height: 5,),
                     checkButton(useDarkMode, "Use Dark Mode", (){
                       setState(() {
                         useDarkMode = !useDarkMode;
                         if(useDarkMode)DialogManager.switchToDarkMode();
                         if(!useDarkMode)DialogManager.switchToLightMode();
                       });
                     }),
                     checkButton(searchalble, "Searchable List", (){
                       setState(() {
                         searchalble = !searchalble;
                       });
                     }),
                     checkButton(multipleseclection, "Allow Multiple Selection", (){
                       setState(() {
                         multipleseclection = !multipleseclection;
                       });
                     }),
                     checkButton(returnIndex, "Return indexes", () {
                       setState(() {
                         returnIndex = !returnIndex;
                       });
                     }
                     ),
                     // const SizedBox(height: 5,),
                     Container(
                       height: 40,
                       width: double.infinity,
                       margin: const EdgeInsets.fromLTRB(15,5,15,0),
                       child: TextButton(onPressed: (){

                         DialogManager.showSimpleListDialog(context,
                             items: ["Wallet","Phone","Clock","Coffee"],
                             searchable: searchalble,
                             maxSelections: multipleseclection?3:1,
                             returnIndexes: returnIndex,
                             onItemSelected: (dynamic item){
                               showSnackBar(item);
                             });

                       },
                           style: TextButton.styleFrom(
                               backgroundColor: Colors.blue
                           ),
                           child: const Text("Show Simple List Dialog",
                             style: TextStyle(color: Colors.white,fontSize: 16),)),
                     ),

                     Container(
                       height: 40,
                       width: double.infinity,
                       margin: const EdgeInsets.fromLTRB(15,20,15,20),
                       child: TextButton(onPressed: (){

                         DialogManager.showComplexListDialog(context,
                             items: [
                               ListItem(title: "Wallet", subtitle: "How much is in this wallet"),
                               ListItem(title: "Phone", subtitle: "This is my phone"),
                               ListItem(title: "Clock", subtitle: "Please check the time for me"),
                               ListItem(title: "Coffee",  subtitle: "I need a cup of coffee"),
                             ],
                             searchable: searchalble,
                             maxSelections: multipleseclection?3:1,
                             returnIndexes: returnIndex,
                             onItemSelected: (dynamic item){
                               if(multipleseclection && !returnIndex){
                                 showSnackBar("${List.generate(item.length, (index) => item[index].title)}");
                               }else {
                                 showSnackBar(item);
                               }
                             });

                       },
                           style: TextButton.styleFrom(
                               backgroundColor: Colors.blue
                           ),
                           child: const Text("Show Complex List Dialog 1",
                             style: TextStyle(color: Colors.white,fontSize: 16),)),
                     ),


                     Container(
                       height: 40,
                       width: double.infinity,
                       margin: const EdgeInsets.fromLTRB(15,0,15,20),
                       child: TextButton(onPressed: (){

                         DialogManager.showComplexListDialog(context,
                             items: [
                               ListItem(title: "Wallet", icon: Icons.wallet,),
                               ListItem(title: "Phone", icon: Icons.phone_android,),
                               ListItem(title: "Clock", icon: Icons.access_time_outlined,),
                               ListItem(title: "Coffee", icon: Icons.coffee,),
                             ],
                             searchable: searchalble,
                             maxSelections: multipleseclection?3:1,
                             returnIndexes: returnIndex,
                             onItemSelected: (dynamic item){
                               if(multipleseclection && !returnIndex){
                                 showSnackBar("${List.generate(item.length, (index) => item[index].title)}");
                               }else {
                                 showSnackBar(item);
                               }
                             });

                       },
                           style: TextButton.styleFrom(
                               backgroundColor: Colors.blue
                           ),
                           child: const Text("Show Complex List Dialog 2",
                             style: TextStyle(color: Colors.white,fontSize: 16),)),
                     ),


                     Container(
                       height: 40,
                       width: double.infinity,
                       margin: const EdgeInsets.fromLTRB(15,0,15,20),
                       child: TextButton(onPressed: (){

                         DialogManager.showComplexListDialog(context,
                             items: [
                               ListItem(title: "Wallet", icon: Icons.wallet, subtitle: "How much is in this wallet"),
                               ListItem(title: "Phone", icon: Icons.phone_android, subtitle: "This is my phone"),
                               ListItem(title: "Clock", icon: Icons.access_time_outlined, subtitle: "Please check the time for me"),
                               ListItem(title: "Coffee", icon: Icons.coffee, subtitle: "I need a cup of coffee"),
                             ],
                             searchable: searchalble,
                             maxSelections: multipleseclection?3:1,
                             returnIndexes: returnIndex,
                             onItemSelected: (dynamic item){
                               if(multipleseclection && !returnIndex){
                                 showSnackBar("${List.generate(item.length, (index) => item[index].title)}");
                               }else {
                                 showSnackBar(item);
                               }
                             });

                       },
                           style: TextButton.styleFrom(
                               backgroundColor: Colors.blue
                           ),
                           child: const Text("Show Complex List Dialog 3",
                             style: TextStyle(color: Colors.white,fontSize: 16),)),
                     ),




                   ],
                 ),
               ),
             ],
           ),
         )
       // This trailing comma makes auto-formatting nicer for build methods.
     );
   }

   Widget checkButton(bool defaultValue,String text,Function() onChecked){
     return GestureDetector(
       onTap: (){
         onChecked();
       },
       child: Container(color: Colors.transparent,
         child: Row(
           mainAxisSize: MainAxisSize.min,
           children: [
             Checkbox(value: defaultValue, onChanged: (b){
               onChecked();
             },),
             Text(text)
           ],
         ),
       ),
     );
   }

   void showSnackBar(var text){
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$text"),
       duration: const Duration(seconds: 1),),);
   }
 }
