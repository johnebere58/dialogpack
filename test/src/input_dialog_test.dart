import 'package:dialogpack/src/test_screens/sample_widget_complex_list_test.dart';
import 'package:dialogpack/src/test_screens/sample_widget_input_test.dart';
import 'package:dialogpack/src/test_screens/sample_widget_list_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dialogpack/src/dialog_manager.dart';


 void main(){

   DialogManager.initialize();

   group("Test input dialog",(){

     testInputDialog("Click Me", "[John Ebere]");

   });
 }

 void testInputDialog(String buttonText,String resultText,){

   testWidgets("Test if text is entered and received $buttonText", (tester)async{
     await tester.pumpWidget( const MaterialApp(home: SampleWidgetInputTest(),));
     await tester.pumpAndSettle();

     await tester.tap(find.text(buttonText));
     await tester.pumpAndSettle(const Duration(milliseconds: 500));

     await tester.enterText(find.byKey(const ValueKey("Name")),"John Ebere");
     await tester.pumpAndSettle(const Duration(milliseconds: 100));
     await tester.tap(find.text("Ok"),warnIfMissed: false);
     await tester.pumpAndSettle(const Duration(milliseconds: 500));

     Text text = (find.byKey(const ValueKey("text")).evaluate().single.widget as Text);
     tester.printToConsole("Text data: ${text.data}");

     expect(find.text(resultText), findsOneWidget);
     expect(find.text(buttonText), findsOneWidget);
   });
 }


