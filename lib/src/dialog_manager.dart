

 import 'package:flutter/cupertino.dart';
import 'package:simpledialog/src/blocs/message_dialog_controller.dart';
import 'package:simpledialog/src/repository/repository.dart';

class DialogManager{

    static bool initialized = false;

    ///very important please call this method first
    static initialize(){
        if(!initialized) {
            Repository.startUp();
            initialized = true;
        }
    }

    static showMessageDialog(BuildContext context,){

    }

    static dismissMessageDialog({required String dialogId}){
        MessageDialogController.instance.hideDialog(dialogKey: dialogId);
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