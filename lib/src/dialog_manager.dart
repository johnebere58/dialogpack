

 import 'package:flutter/cupertino.dart';
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

    static showMessageDialog(BuildContext context,
        {required MessageDialogModel messageDialogModel,Widget? transition}){
      if(!initialized){
          throw Exception("Please call [${DialogManager.initialize()}] first");
      }

      launchNewScreen(context, MessageDialog(messageDialogModel: messageDialogModel),
      transitionBuilder: transition??slideUpTransition);
    }

    static dismissMessageDialog({String? dialogId}){
        MessageDialogController.instance.hideDialog(dialogKey: dialogId??DEFAULT_MESSAGE_DIALOG_ID);
    }

    static showYesNoDialog(BuildContext context,){

    }

    static showSuccessDialog(BuildContext context,){

    }

    static showFailedDialog(BuildContext context,){

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