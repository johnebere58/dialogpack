import 'package:dialogpack/src/test_screens/sample_widget_list_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dialogpack/src/dialog_manager.dart';


 void main(){

   DialogManager.initialize();

   group("Test list dialog",(){

     testListDialog("Click Me", "Item 0");
     testListDialog("Click Me for Index", "Index 0");
     testListDialogWithMultipleSelection("Click Me for Multiple Items",
         "Items [Item 0, Item 2, Item 4]");
     testListDialogWithMultipleSelection("Click Me for Multiple Indexes",
     "Indexes [0, 2, 4]");

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

 void testListDialogWithMultipleSelection(String buttonText,String resultText){

   testWidgets("Test list clicking $buttonText with multiple selection", (tester)async{
     await tester.pumpWidget(const MaterialApp(home: SampleWidgetListTest(),));
     await tester.pumpAndSettle();

     await tester.tap(find.text(buttonText));
     await tester.pumpAndSettle(const Duration(milliseconds: 500));

     await tester.tap(find.text("Item 0"));
     await tester.tap(find.text("Item 2"));
     await tester.tap(find.text("Item 4"));
     await tester.pumpAndSettle(const Duration(milliseconds: 100));
     await tester.tap(find.text("Ok"));
     await tester.pumpAndSettle(const Duration(milliseconds: 500));

     Text text = (find.byKey(const ValueKey("text")).evaluate().single.widget as Text);

     tester.printToConsole("Text data: ${text.data}");
     expect(find.text(resultText), findsOneWidget);
     expect(find.text(buttonText), findsOneWidget);
   });

 }


