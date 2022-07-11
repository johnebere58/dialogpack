

 import 'package:dialogpack/src/dialogs/list_dialog.dart';
import 'package:dialogpack/src/models/list_item.dart';
import 'package:dialogpack/src/models/list_type.dart';
import 'package:dialogpack/src/utils/list_dailog_utils.dart';
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

    ///very important please call this method first
    static initialize({bool useDarkMode=false}){
      darkMode = useDarkMode;
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

    static _showListDialog(BuildContext context,{
      required ListType listType,
      required List<ListItem> listItems,
      required Function(dynamic item) onItemSelected,
      String? title,Widget? transition,
      bool returnIndex=false,
      bool searchable=false,
      int maxSelections = 1,
      }){

      launchNewScreen(context, ListDialog(listItems,title: title,
        listType: listType,
        searchable: searchable,),
          transitionBuilder: transition??slideUpTransition,
          result: (dynamic _){
            if(_==null)return;
            List<String> selectedIds = _ ;
            if(selectedIds.isEmpty)return;

            List<int> selectedIndexes = getSelectedIndexes(listItems, selectedIds);

            if(selectedIndexes.isEmpty)return;

            if(listType == ListType.normal) {
              if (returnIndex) {
                onItemSelected(selectedIndexes[0]);
              } else {
                onItemSelected(listItems[selectedIndexes[0]].title);
              }
            }else{
              if (returnIndex) {
                onItemSelected(selectedIndexes);
              } else {
                List selectedListItems = List.generate(selectedIndexes.length, (index) =>
                listItems[index]);
                onItemSelected(selectedListItems);
              }
            }

          });
    }

    /// show a list dialog to select a single item
    /// the dialog item should be a [List] of [String]
    /// You can set the dialog to be [searchable]
    ///
    /// use the function [onItemSelected] to get the item or position of item selected
    /// [onItemSelected] will return a single item or a list of items depending on the
    /// the value of [allowMultipleSelection]
    /// if [allowMultipleSelection] is set to true [onItemSelected] will return a list of values
    /// if [allowMultipleSelection] is set to false [onItemSelected] will return a single value
    ///
    /// You can choose for the return value to be a [String] of item or [int] position of the selected item using [returnIndex]
    /// if [returnIndex] is set to true, the value will be an [int] of the position
    /// if [returnIndex] is set to false, the value will be the String selected
    /// [returnIndex] is false by default
    ///
    ///
    static showSimpleListDialog(BuildContext context,{
      required List<String> items,
      required Function(dynamic item) onItemSelected,
      String? title,Widget? transition,
      bool returnIndex=false,
      bool searchable=false,
      bool allowMultipleSelection=false,
      int maxSelections = 1}){

      List<ListItem> listItems = List.generate(items.length, (index){
        return ListItem(title: items[index]);
      });

      _showListDialog(context, listItems: listItems,
          listType: ListType.normal,
          onItemSelected: onItemSelected,
          returnIndex: returnIndex,
          title: title,
          searchable: searchable,
          transition: transition,
          maxSelections: maxSelections);
    }

    static showMultipleSelectionSimpleListDialog(BuildContext context,{
      required List<String> items,
      ListType listType=ListType.normal,
      String? title,Widget? transition}){

      List<ListItem> listItems = List.generate(items.length, (index){
        return ListItem(title: items[index]);
      });

      launchNewScreen(context, ListDialog(listItems,title: title,),
          transitionBuilder: transition??slideUpTransition);
    }



    static showComplexListDialog(BuildContext context,{
      required List<ListItem> items,
      ListType listType=ListType.normal,
      String? title,Widget? transition}){

      launchNewScreen(context, ListDialog(items,title: title,),
          transitionBuilder: transition??slideUpTransition);

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