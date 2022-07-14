import 'package:dialogpack/src/dialogs/list_dialog.dart';
import 'package:dialogpack/src/models/list_item.dart';
import 'package:dialogpack/src/models/message_dialog_style.dart';
import 'package:flutter/material.dart';
import 'package:dialogpack/src/assets/string_assets.dart';
import 'package:dialogpack/src/blocs/message_dialog_controller.dart';
import 'package:dialogpack/src/dialogs/message_dialog.dart';
import 'package:dialogpack/src/models/message_dialog_model.dart';
import 'package:dialogpack/src/repository/repository.dart';
import 'package:dialogpack/src/utils/transitions.dart';
import 'package:dialogpack/src/utils/widget_utils.dart';

class DialogManager{

    static bool initialized = false;
    static bool darkMode = false;
    static MessageDialogStyle? globalMessageDialogStyle;

    ///very important please call this method first
    static initialize({bool useDarkMode=false,messageDialogStyle}){
      darkMode = useDarkMode;
      globalMessageDialogStyle = messageDialogStyle;
        if(!initialized) {
            Repository.startUp();
            initialized = true;
        }
    }

    static void switchToDarkMode(){
      darkMode = true;
    }
    static void switchToLightMode(){
      darkMode = false;
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
            gif: 'success2.gif',
            iconOrImageSize: 120,
            iconOrImageColor: Colors.blue,
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
            icon: Icons.error_outline,iconOrImageColor: Colors.red,
            message: message,title: title,
            onPositiveClicked: clickedYes,
        )),
            transitionBuilder: transition??slideUpTransition);
    }

    static _showListDialog(BuildContext context,{
      required List<ListItem> listItems,
      required Function(List<ListItem> item) onItemSelected,
      String? title,Widget? transition,
      bool searchable=false,
      int maxSelections = 1,
      Color? buttonColor,
      Color? titleColor,
      }){

      launchNewScreen(context, ListDialog(listItems,
        title: title,
        maxSelection: maxSelections,
        buttonColor: buttonColor,
        titleColor: titleColor,
        searchable: searchable,),
          transitionBuilder: transition??slideUpTransition,
          result: (dynamic _){
            if(_==null)return;
            List<String> selectedIds = _ ;
            if(selectedIds.isEmpty)return;

            List<ListItem> selectedListItems = List.generate(selectedIds.length,
                    (index) =>
            listItems.firstWhere((element) => element.itemKey == selectedIds[index]));
            onItemSelected(selectedListItems);

          });
    }

    /// show a simple list dialog
    /// the dialog item should be a [List] of [String]s eg. ["apple", "ball", "cake"]
    /// You can set the dialog to be [searchable]
    ///
    /// use the function [onItemSelected] to get the item or position of item selected
    /// [onItemSelected] will return a single item eg. "apple"
    /// or a list of items eg. ["apple","cake"]
    /// depending on the value of [maxSelections]

    /// You can choose for the return value to be a [String] eg. "apple"
    /// or [int] position of the selected eg. 0
    /// if "apple" is at position 0
    /// by setting using [returnIndexes] to true
    ///
    ///
    /// if [returnIndexes] is set to true, the value will be an [int] of the position
    /// if [returnIndexes] is set to false, the value will be the String selected
    /// [returnIndexes] is false by default
    ///
    /// If you set [maxSelections] is greater than 1
    /// the value return in [onItemSelected] will
    /// be a [List] of [String] eg. ["apple", "cake"]
    /// or a [List] of [int] eg. [0, 2]
    /// depending if [returnIndexes] si set to true
    ///
    ///
    static showSimpleListDialog(BuildContext context,{
      required List<String> items,
      required Function(dynamic item) onItemSelected,
      String? title,Widget? transition,
      bool returnIndexes=false,
      bool searchable=false,
      int maxSelections = 1,
      Color? buttonColor,
      Color? titleColor}){
      
      if(maxSelections<1){
        throw UnimplementedError("[maxSelections] cannot be less than 1");
      }

      List<ListItem> listItems = List.generate(items.length, (index){
        return ListItem(title: items[index]);
      });

      _showListDialog(context, listItems: listItems,
          title: title,
          searchable: searchable,
          transition: transition,
          maxSelections: maxSelections,
          titleColor: titleColor,
          buttonColor: buttonColor,
          onItemSelected: (List<ListItem> resultItems){
            if(maxSelections==1) {
              ListItem listItem = resultItems[0];
              if (returnIndexes) {
                int index = listItems.indexWhere((element) =>
                element.title
                    == listItem.title);
                onItemSelected(index);
              } else {
                onItemSelected(listItem.title);
              }
            }else{
              if(returnIndexes){
                List itemIndexes = List.generate(resultItems.length, (index) => items.indexOf(resultItems[index].title));
                onItemSelected(itemIndexes);
              }else{
                List selectedItems = List.generate(resultItems.length, (index) => resultItems[index].title);
                onItemSelected(selectedItems);
              }
            }
          });
    }


    /// similar to showing a simple list dialog
    /// the dialog item should be a [List] of [ListItem]s eg. [ListItem, ListItem, ListItem]
    /// You can set the dialog to be [searchable]
    ///
    /// use the function [onItemSelected] to get the item or position of item selected
    /// [onItemSelected] will return a single [ListItem] item
    /// or a list of [List] list items eg. [ListItem, ListItem]
    /// depending on the value of [maxSelections]

    /// You can choose for the return value to be a [ListItem]
    /// or [int] position of the [ListItem] selected eg. 0
    /// by setting using [returnIndexes] to true
    ///
    ///
    /// if [returnIndexes] is set to true, the value will be an [int] of the position
    /// if [returnIndexes] is set to false, the value will be the String selected
    /// [returnIndexes] is false by default
    ///
    /// If you set [maxSelections] is greater than 1
    /// the value return in [onItemSelected] will
    /// be a [List] of [String] eg. [ListItem, ListItem]
    /// or a [List] of [int] eg. [0, 2]
    /// depending if [returnIndexes] si set to true
    ///
    ///
    static showComplexListDialog(BuildContext context,{
      required List<ListItem> items,
      required Function(dynamic item) onItemSelected,
      String? title,Widget? transition,
      bool returnIndexes=false,
      bool searchable=false,
      int maxSelections = 1,
      Color? buttonColor,
      Color? titleColor}){

      if(maxSelections<1){
        throw UnimplementedError("[maxSelections] cannot be less than 1");
      }

      _showListDialog(context, listItems: items,
          title: title,
          searchable: searchable,
          transition: transition,
          maxSelections: maxSelections,
          titleColor: titleColor,
          buttonColor: buttonColor,
          onItemSelected: (List<ListItem> resultItems){
            if(maxSelections==1) {
              ListItem listItem = resultItems[0];
              if (returnIndexes) {
                int index = items.indexWhere((element) =>
                element.itemKey
                    == listItem.itemKey);
                onItemSelected(index);
              } else {
                onItemSelected(listItem);
              }
            }else{
              if(returnIndexes){
                List itemIndexes = List.generate(resultItems.length, (index) => items.indexOf(resultItems[index]));
                onItemSelected(itemIndexes);
              }else{
                List selectedItems = List.generate(resultItems.length, (index) => resultItems[index]);
                onItemSelected(selectedItems);
              }
            }
          });
    }

    static showInputDialog(BuildContext context,){

    }

    static showProgressDialog(BuildContext context,){

    }

    static showBottomListDialog(BuildContext context,){

    }

    static poptopMessage(){

    }

 }