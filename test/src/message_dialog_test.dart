import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simpledialog/src/dialog_manager.dart';
import 'package:simpledialog/src/dialogs/message_dialog.dart';
import 'package:simpledialog/src/models/message_dialog_model.dart';
import 'package:simpledialog/src/repository/repository.dart';

 void main(){

   DialogManager.initialize();

   group("Test message dialog",(){

     testButtons("positive", "Ok");
     testButtons("negative", "No");
     testButtons("neutral", "Maybe");

     testButtons("positive", "Ok", autoDismiss: false);
     testButtons("negative", "No", autoDismiss: false);
     testButtons("neutral", "Maybe", autoDismiss: false);

   });

 }

void testButtons(String buttonName, String buttonText,{bool autoDismiss=true}){

  MessageDialogModel messageDialogModel = MessageDialogModel(
      message: "Message", title: "Title",
      negativeClickText: "No",neutralClickText: "Maybe",
      autoDismissAfterClick: autoDismiss
  );

  testWidgets("Test $buttonName button", (tester)async{

    await tester.pumpWidget(MaterialApp(home:
    MessageDialog(messageDialogModel: messageDialogModel,),));
    await tester.pumpAndSettle(const Duration(milliseconds: 500));
    await tester.tap(find.text(buttonText));
    await tester.pumpAndSettle(const Duration(milliseconds: 1000));
    expect(find.text("Title"), autoDismiss?findsNothing:findsOneWidget);

    if(!autoDismiss){
      DialogManager.dismissMessageDialog();
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      tester.printToConsole("Dismissed Dialog");
      expect(find.text("Title"), findsNothing);
    }
  });
}