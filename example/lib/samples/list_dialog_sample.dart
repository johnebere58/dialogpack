
 import 'package:dialogpack/dialogpack.dart';
import 'package:flutter/material.dart';

class ListDialogSample extends StatefulWidget {
  const ListDialogSample({Key? key}) : super(key: key);

   @override
   _ListDialogSampleState createState() => _ListDialogSampleState();
 }

 class _ListDialogSampleState extends State<ListDialogSample> {

   bool useDarkMode = false;
   bool searchalble = false;
   bool multipleseclection = false;
   bool returnIndex = false;
   bool showTitle = false;

   double dialogCurveRadius = 20.0;
   double dialogElevation = 5.0;
   DialogPlacement dialogPlacement = DialogPlacement.center;
   DialogEntrance dialogEntrance = DialogEntrance.scale;
   double dialogMargin = 40.0;
   double titleTextSize = 20.0;
   double messageTextSize = 20.0;
   double itemSpacing = 15;
   bool showDivider = false;
   DialogButtonDesign dialogButtonDesign = DialogButtonDesign.normal;
   DialogButtonFit dialogButtonFit = DialogButtonFit.normal;
   DialogButtonAlignment dialogButtonAlignment = DialogButtonAlignment.center;
   double dialogButtonSpacing = 5.0;
   double dialogButtonTextSize = 18.0;
   double dialogButtonCornerRadius = 5.0;
   double dialogButtonHeight = 45.0;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    useDarkMode = DialogManager.darkMode;
    resetStyle();
  }

   void resetStyle(){
     DialogManager.defaultListDialogStyle = ListDialogStyle(
       titleTextSize: titleTextSize,
       showButtonDivider: showDivider,
       messageTextSize: messageTextSize,
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
     );
   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(
         appBar: AppBar(
           title: const Text('List Dialog'),
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

                       DialogManager.showSimpleListDialog(context,
                           items: ["Wallet","Phone","Clock","Coffee"],
                           searchable: searchalble,
                           maxSelections: multipleseclection?3:1,
                           returnIndexes: returnIndex,
                           title: !showTitle?null:"Simple Dialog",
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
                     // width: double.infinity,
                     margin: const EdgeInsets.all(10),
                     child: TextButton(onPressed: (){

                       DialogManager.showComplexListDialog(context,
                           listDialogModel: ListDialogModel(
                             listItems: [
                               ListItem(title: "Wallet", subtitle: "How much is in this wallet"),
                               ListItem(title: "Phone", subtitle: "This is my phone"),
                               ListItem(title: "Clock", subtitle: "Please check the time for me"),
                               ListItem(title: "Coffee",  subtitle: "I need a cup of coffee"),
                             ],
                             searchable: searchalble,
                             maxSelection: multipleseclection?3:1,
                             title: !showTitle?null:"Complex Dialog 1",
                           ),
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
                     // width: double.infinity,
                     margin: const EdgeInsets.all(10),
                     child: TextButton(onPressed: (){

                       DialogManager.showComplexListDialog(context,
                           listDialogModel: ListDialogModel(listItems: [
                             ListItem(title: "Wallet", icon: Icons.wallet,),
                             ListItem(title: "Phone", icon: Icons.phone_android,),
                             ListItem(title: "Clock", icon: Icons.access_time_outlined,),
                             ListItem(title: "Coffee", icon: Icons.coffee,),
                           ],title: !showTitle?null:"Complex Dialog 2",
                             searchable: searchalble,
                             maxSelection: multipleseclection?3:1,),
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
                     // width: double.infinity,
                     margin: const EdgeInsets.all(10),
                     child: TextButton(onPressed: (){

                       DialogManager.showComplexListDialog(context,
                           listDialogModel: ListDialogModel(listItems: [
                             ListItem(title: "Wallet", icon: Icons.wallet, subtitle: "How much is in this wallet"),
                             ListItem(title: "Phone", icon: Icons.phone_android, subtitle: "This is my phone"),
                             ListItem(title: "Clock", icon: Icons.access_time_outlined, subtitle: "Please check the time for me"),
                             ListItem(title: "Coffee", icon: Icons.coffee, subtitle: "I need a cup of coffee"),
                           ],
                             title: !showTitle?null:"Complex Dialog 3",
                             searchable: searchalble,
                             maxSelection: multipleseclection?3:1,),
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
                           checkButton(searchalble, "Searchable List", (){
                             setState(() {
                               searchalble = !searchalble;
                             });
                           }),
                           const SizedBox(height: 15,),
                           checkButton(multipleseclection, "Allow Multiple Selection", (){
                             setState(() {
                               multipleseclection = !multipleseclection;
                             });
                           }),
                           const SizedBox(height: 15,),
                           checkButton(returnIndex, "Return indexes", () {
                             setState(() {
                               returnIndex = !returnIndex;
                             });
                           }
                           ),
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
