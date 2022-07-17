import 'package:dialogpack/dialogpack.dart';
import 'package:dialogpack/src/assets/color_assets.dart';
import 'package:dialogpack/src/dialogs/input_dialog.dart';
import 'package:dialogpack/src/dialogs/list_dialog.dart';
import 'package:dialogpack/src/dialogs/popup_dialog.dart';
import 'package:flutter/material.dart';
import 'package:dialogpack/src/assets/string_assets.dart';
import 'package:dialogpack/src/blocs/message_dialog_controller.dart';
import 'package:dialogpack/src/dialogs/message_dialog.dart';
import 'package:dialogpack/src/repository/repository.dart';
import 'package:dialogpack/src/utils/transitions.dart';
import 'package:dialogpack/src/utils/widget_utils.dart';

class DialogManager{

    static bool initialized = false;
    static bool darkMode = false;
    static MessageDialogStyle defaultMessageDialogStyle = MessageDialogStyle();
    static ListDialogStyle defaultListDialogStyle = ListDialogStyle();
    static InputDialogStyle defaultInputDialogStyle = InputDialogStyle();
    static PopupDialogStyle defaultPopupDialogStyle = PopupDialogStyle(dialogStyle:
    const DialogStyle(
      dialogPlacement: DialogPlacement.top,margin: 0.0,elevation: 0,curvedRadius: 0,

    ),);
    static DialogEntrance defaultEntrance = DialogEntrance.scale;

    ///very important please call this method first
    static initialize({bool useDarkMode=false,
      MessageDialogStyle? messageDialogStyle,
      ListDialogStyle? listDialogStyle,
      InputDialogStyle? inputDialogStyle,
      PopupDialogStyle? popupDialogStyle,
      DialogEntrance? dialogEntrance}){
      darkMode = useDarkMode;
      if(messageDialogStyle!=null){
        defaultMessageDialogStyle = messageDialogStyle;
      }
      if(listDialogStyle!=null){
        defaultListDialogStyle = listDialogStyle;
      }
      if(inputDialogStyle!=null){
        defaultInputDialogStyle = inputDialogStyle;
      }
      if(popupDialogStyle!=null){
        defaultPopupDialogStyle = popupDialogStyle;
      }
      if(dialogEntrance!=null){
        defaultEntrance=dialogEntrance;
      }
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
        {required MessageDialogModel messageDialogModel, DialogEntrance? dialogEntrance}){
      if(!initialized){
          throw Exception("Please call [${DialogManager.initialize()}] first");
      }

      launchNewScreen(context, MessageDialog(messageDialogModel: messageDialogModel),
      transitionBuilder: getTransition(dialogEntrance: dialogEntrance));
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
          DialogEntrance? dialogEntrance
        }){
        launchNewScreen(context, MessageDialog(messageDialogModel:
        MessageDialogModel(
            message: message,title: title,
            positiveClickText: positiveText,
            negativeClickText: negativeText,
            onPositiveClicked: clickedYes,
            onNegativeClicked: clickedNo
        )),
            transitionBuilder: getTransition(dialogEntrance: dialogEntrance));
    }

    /// use this method to show a message dialog for a successful operation
    static showSuccessDialog(BuildContext context,
        {required String message,Function? clickedYes,
            String? title,DialogEntrance? dialogEntrance
        }){
        launchNewScreen(context, MessageDialog(messageDialogModel:
        MessageDialogModel(
            gif: 'assets/success2.gif',assetPackage: "dialogpack",
            message: message,title: title,
            onPositiveClicked: clickedYes,
            messageDialogStyle: MessageDialogStyle.empty(
          imageOrIconStyle: const ImageOrIconStyle(size: 100,imageOrIconPlacement: ImageOrIconPlacement.top,color: Colors.blue)
          ),
        )),
            transitionBuilder: getTransition(dialogEntrance: dialogEntrance));
    }

    /// use this method to show a message dialog for a failed operation
    static showFailedDialog(BuildContext context,
        {required String message,Function? clickedYes,
            String? title,
          DialogEntrance? dialogEntrance
        }){
        launchNewScreen(context, MessageDialog(messageDialogModel:
        MessageDialogModel(
            gif: 'assets/failed.gif',assetPackage: "dialogpack",
            message: message,title: title,
            onPositiveClicked: clickedYes,
            messageDialogStyle: MessageDialogStyle.empty(
              positiveTextButtonColor: blackColor,
                imageOrIconStyle: const ImageOrIconStyle(
                    color: Colors.red,
                    size: 100,imageOrIconPlacement: ImageOrIconPlacement.top)
            ),
        )),
            transitionBuilder: getTransition(dialogEntrance: dialogEntrance));
    }

    static _showListDialog(BuildContext context,{
      required ListDialogModel listDialogModel,
      required Function(List<ListItem> item) onItemSelected,
      DialogEntrance? dialogEntrance,
      }){

      launchNewScreen(context, ListDialog(listDialogModel: listDialogModel,),
          transitionBuilder: getTransition(dialogEntrance: dialogEntrance),
          result: (dynamic _){
            if(_==null)return;
            List<String> selectedIds = _ ;
            if(selectedIds.isEmpty)return;

            List<ListItem> listItems = listDialogModel.listItems;
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
      bool returnIndexes=false,
      String? title,
      bool searchable=false,
      int maxSelections = 1,
      String? buttonText,
      Color? buttonColor,
      Color? titleColor,
      ListDialogStyle? listDialogStyle, DialogEntrance? dialogEntrance}){
      
      if(maxSelections<1){
        throw UnimplementedError("[maxSelections] cannot be less than 1");
      }

      List<ListItem> listItems = List.generate(items.length, (index){
        return ListItem(title: items[index]);
      });

      ListDialogModel listDialogModel = ListDialogModel(listItems: listItems,
      title: title,listDialogStyle: listDialogStyle,maxSelection: maxSelections,searchable: searchable);

      _showListDialog(context, listDialogModel: listDialogModel,dialogEntrance: dialogEntrance,
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
      required ListDialogModel listDialogModel,
      required Function(dynamic item) onItemSelected,
      bool returnIndexes=false,  DialogEntrance? dialogEntrance
      }){


      _showListDialog(context, listDialogModel: listDialogModel,dialogEntrance: dialogEntrance,
          onItemSelected: (List<ListItem> resultItems){
        int maxSelections = listDialogModel.maxSelection;
        List<ListItem> items = listDialogModel.listItems;
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

    static showInputDialog(BuildContext context,{
      required List<InputItem> inputItems,
      required Function(List<String>) onSummit,
      String? title,
      String buttonText="Ok",
      InputDialogStyle? inputDialogStyle,
      bool inheritStyle=true,
      DialogEntrance? dialogEntrance}){

      InputDialogModel inputDialogModel = InputDialogModel(
          inputItems: inputItems,
          inheritStyle: inheritStyle,
          title: title,
          buttonText: buttonText,
          inputDialogStyle: inputDialogStyle);

      launchNewScreen(context,
          InputDialog(inputDialogModel: inputDialogModel),
          transitionBuilder: getTransition(dialogEntrance:dialogEntrance),
      result: (_){
        if(_==null)return;
        onSummit(_);
      });
    }

    static showPopupDialog(BuildContext context,{
      required String message,
      IconData? icon,
      bool inheritStyle=true,
      int durationInMilliseconds=2500,
      PopupDialogStyle? popupDialogStyle,
      DialogEntrance? dialogEntrance}){


      launchNewScreen(context,
          PopupDialog(popupDialogModel: PopupDialogModel(
            message: message,icon: icon,inheritStyle: inheritStyle,
              durationInMilliseconds: durationInMilliseconds,
             popupDialogStyle: popupDialogStyle
          )),
          transitionBuilder: getTransition(dialogEntrance:dialogEntrance??DialogEntrance.slide_down));
    }

    static showProgressDialog(BuildContext context,){

    }

    static showBottomListDialog(BuildContext context,){

    }


    static dynamic getTransition({DialogEntrance? dialogEntrance}) {
      dialogEntrance = dialogEntrance ?? defaultEntrance;
      return
      dialogEntrance == DialogEntrance.slide_left ? slideTransition :
      dialogEntrance == DialogEntrance.scale ? scaleTransition :
      dialogEntrance == DialogEntrance.fade_in ? fadeTransition :
      dialogEntrance == DialogEntrance.slide_down ? slideDownTransition :
      dialogEntrance == DialogEntrance.slide_right ? slideRightTransition :
      slideUpTransition;
    }

 }