

 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simpledialog/src/assets/string_assets.dart';
import 'package:simpledialog/src/blocs/message_dialog_controller.dart';
import 'package:simpledialog/src/dialogs/message_dialog.dart';
import 'package:simpledialog/src/models/message_dialog_model.dart';
import 'package:simpledialog/src/repository/repository.dart';
import 'package:simpledialog/src/utils/transitions.dart';
import 'package:simpledialog/src/utils/widget_utils.dart';

class DialogManager{

    static bool initialized = false;

    ///very important please call this method first
    static initialize(){
        if(!initialized) {
            Repository.startUp();
            initialized = true;
        }
    }

    /// use this method to show a dialog
    /// use [MessageDialogModel] to customize the look and feel of your dialog
    /// You can add your custom [transition] to slide in the dialog
    ///
    static showMessageDialog(BuildContext context,
        {required MessageDialogModel messageDialogModel,Widget? transition}){
      if(!initialized){
          throw Exception("Please call [${DialogManager.initialize()}] first");
      }

      launchNewScreen(context, MessageDialog(messageDialogModel: messageDialogModel),
      transitionBuilder: transition??slideUpTransition);
    }

    /// Use this method to dismiss any dialog using the optional [dialogId]
    static dismissMessageDialog({String? dialogId}){
        MessageDialogController.instance.hideDialog(dialogKey: dialogId??DEFAULT_MESSAGE_DIALOG_ID);
    }

    /// use this method to display a message dialog specifically for yes/no options
    static showYesNoDialog(BuildContext context,
        {required String message,required Function clickedYes,
            String positiveText="Yes",
            String negativeText="No",
            Function? clickedNo,
            String? title,
            Widget? transition}){
        launchNewScreen(context, MessageDialog(messageDialogModel:
        MessageDialogModel(
            message: message,title: title,
            positiveClickText: positiveText,
            negativeClickText: negativeText,
            onPositiveClicked: clickedYes,
            onNegativeClicked: clickedNo
        )),
            transitionBuilder: transition??slideUpTransition);
    }

    /// use this method to show a message dialog for a successful operation
    static showSuccessDialog(BuildContext context,
        {required String message,Function? clickedYes,
            String? title,
            Widget? transition}){
        launchNewScreen(context, MessageDialog(messageDialogModel:
        MessageDialogModel(
            icon: Icons.check_circle_outlined,
            message: message,title: title,
            onPositiveClicked: clickedYes,
        )),
            transitionBuilder: transition??slideUpTransition);
    }

    /// use this method to show a message dialog for a failed operation
    static showFailedDialog(BuildContext context,
        {required String message,Function? clickedYes,
            String? title,
            Widget? transition}){
        launchNewScreen(context, MessageDialog(messageDialogModel:
        MessageDialogModel(
            icon: Icons.error_outline,iconColor: Colors.red,
            message: message,title: title,
            onPositiveClicked: clickedYes,
        )),
            transitionBuilder: transition??slideUpTransition);
    }

    static showListDialog(BuildContext context,){

    }

    static showInputDialog(BuildContext context,){

    }

    static showProgressDialog(BuildContext context,){

    }

    static showBottomListDialog(BuildContext context,){

    }


 }