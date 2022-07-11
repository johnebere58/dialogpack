import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dialogpack/src/dialog_manager.dart';

import 'sample_widget_list_test.dart';

 void main(){

   DialogManager.initialize();

   group("Test list dialog",(){

     testListDialog("Click Me", "Item 0");
     testListDialog("Click Me for Index", "Index 0");

   });

 }

 void testListDialog(String buttonText,String resultText){

   testWidgets("Test list clicking $buttonText", (tester)async{
     await tester.pumpWidget(const MaterialApp(home: SampleWidgetListTest(),));
     await tester.pumpAndSettle();

     await tester.tap(find.text(buttonText));
     await tester.pumpAndSettle(const Duration(milliseconds: 500));

     await tester.tap(find.text("Item 0"));
     await tester.pumpAndSettle(const Duration(milliseconds: 500));

     expect(find.text(resultText), findsOneWidget);
     expect(find.text(buttonText), findsOneWidget);
   });
 }
