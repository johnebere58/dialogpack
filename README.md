# Dialog Pack

[![Dart](https://github.com/johnebere58/dialogpack/actions/workflows/dart.yml/badge.svg?branch=master)](https://github.com/johnebere58/dialogpack/actions/workflows/dart.yml)

A powerful plugin for displaying message dialogs, list dialogs, success dialogs, failed dialogs,
 input dialogs, popup dialogs and loading dialogs. This plugin is fully customizable with examples

<p>
    <img src="https://github.com/johnebere58/screenshots/blob/master/dialogpack_message_dialog.gif" width="auto" height="400px" hspace="20"/>
    <img src="https://github.com/johnebere58/screenshots/blob/master/dialogpack_success.gif" width="auto" height="400px" hspace="20"/>
    <img src="https://github.com/johnebere58/screenshots/blob/master/dialogpack_failed.gif" width="auto" height="400px" hspace="20"/>
   <img src="https://github.com/johnebere58/screenshots/blob/master/dialogpack_list.gif" width="auto" height="400px" hspace="20"/>
    <img src="https://github.com/johnebere58/screenshots/blob/master/dialogpack_input.gif" width="auto" height="400px" hspace="20"/>
   <img src="https://github.com/johnebere58/screenshots/blob/master/dialogpack_popup.gif" width="auto" height="400px" hspace="20"/>
    <img src="https://github.com/johnebere58/screenshots/blob/master/dialogpack_loading.gif" width="auto" height="400px" hspace="20"/>
</p>

- [x] Message Dialog
- [x] Success Dialog
- [x] Failed Dialog
- [x] List Dialog
- [x] Input Dialog
- [x] Loading Dialog
- [x] Popup Dialog

[![Buy Me A Coffee](https://bmc-cdn.nyc3.digitaloceanspaces.com/BMC-button-images/custom_images/orange_img.png "Buy Me A Coffee")](https://www.buymeacoffee.com/johnebere58 "Buy Me A Coffee")


## Installation
To use this plugin, add `dialogpack` as a dependency in your pubspec.yaml file. 

```
dependencies:
  flutter:
    sdk: flutter

dialogpack:
  git:
    url: git://github.com/johnebere58/dialogpack.git
    ref: master # branch name

```

## Getting Started

Add `DialogManager.initialize()` to the `initState` method of your root widget

```dart
import 'package:dialogpack/dialogpack.dart';

  @override
  void initState() {
    DialogManager.initialize();
    super.initState();
  }
```
## Optional Global Styling
You can choose to set a global style for all your dialogs during initialization,

```dart
import 'package:dialogpack/dialogpack.dart';

   @override
   void initState() {
     super.initState();
     
    DialogManager.initialize(
      messageDialogStyle: MessageDialogStyle( ... ),
      dialogEntrance: DialogEntrance.fade_in,
      popupDialogStyle: PopupDialogStyle( ... ),
      inputDialogStyle: InputDialogStyle( ... ),
      listDialogStyle: ListDialogStyle( ... ),
    );
   
   }
```

## Showing a Message Dialog
After initialization you can show a method dialog by doing this
<div>
 <img src="https://github.com/johnebere58/screenshots/blob/master/dialogpack_simple_message.jpg" width="auto" height="400px" hspace="20"/>
</div>

 ```dart
 import 'package:dialogpack/dialogpack.dart';
 
   DialogManager.showSimpleMessageDialog(context,
                  message: "This is a simple message dialog", title: "Welcome");

```

## Dark Mode/ Light Mode
Everything is flexible on the go, 
you can switch theme styles or switch from dark theme to light theme
<div>
   <img src="https://github.com/johnebere58/screenshots/blob/master/dialogpack_dark_light.gif" width="auto" height="400px" hspace="20"/>
</div>

 ```dart
     DialogManager.switchToLightMode();
     DialogManager.switchToDarkMode();
```

## Dialog Entrance
You set a custom entrance for any of your dialogs
<div>
   <img src="https://github.com/johnebere58/screenshots/blob/master/dialog_slide_down.gif" width="auto" height="400px" hspace="20"/>
</div>

 ```dart
      DialogManager.showSimpleMessageDialog(context,
                  message: "This is a simple message dialog", 
                  title: "Welcome",
                  dialogEntrance: DialogEntrance.slide_down);
```

## Dialog Placement
You can choose to position your dialog at the top, center or bottom of the screen
<div>
   <img src="https://github.com/johnebere58/screenshots/blob/master/dialogpack_position.gif" width="auto" height="400px" hspace="20"/>
</div>

 ```dart
     DialogManager.showSimpleMessageDialog(context,
                  message: "This is a simple message dialog",
                  title: "Welcome",
                  dialogEntrance: DialogEntrance.slide_up,
                  messageDialogStyle: MessageDialogStyle(
                      dialogStyle: const DialogStyle(
                          dialogPlacement: DialogPlacement.bottom)));
```

## Customizing a Message Dialog
You can use the `MessageDialogStyle` class to style a message dialog however you want
<div>
   <img src="https://github.com/johnebere58/screenshots/blob/master/dialogpack_custom.gif" width="auto" height="400px" hspace="20"/>
</div>


 ```dart
     DialogManager.showSimpleMessageDialog(context,
                  message: "This is a simple message dialog",
                  title: "Welcome",
                  dialogEntrance: DialogEntrance.slide_up,
                  messageDialogStyle: MessageDialogStyle(
                      dialogStyle: const DialogStyle(
                          dialogPlacement: DialogPlacement.bottom,
                      margin: 0.0,curvedRadius: 0.0,elevation: 0.0),
                  titleTextSize: 25.0,
                  dialogButtonDesign: DialogButtonDesign.stroked,
                   buttonSpacing: 10.0,
                  ));
```

## Simple List Dialog
To show a list dialog is very easy, call `DialogManager.showSimpleListDialog`
<div>
   <img src="https://github.com/johnebere58/screenshots/blob/master/dialogpack_simple_list.gif" width="auto" height="400px" hspace="20"/>
</div>

 ```dart
     DialogManager.showSimpleListDialog(context,
                       items: [
                         "Apple", "Ball", "Cake"
                       ],
                       onItemSelected: (dynamic result){
                       showSnackBar(result);
                   });
```
##
You can set the dialog to return the `int` index of the item selection, 
instead of the selection `String` by setting `returnIndexes` to true

<div>
   <img src="https://github.com/johnebere58/screenshots/blob/master/dialogpack_simple_list_index.gif" width="auto" height="400px" hspace="20"/>
</div>

 ```dart
     DialogManager.showSimpleListDialog(context,
                       items: [
                         "Apple", "Ball", "Cake"
                       ],
                       onItemSelected: (dynamic result){
                       showSnackBar(result);
                   }, returnIndexes :true);
```

## Multiple Selection in List Dialog
To selection multiple items you need to set the `maxSelections` parameter to be greater than 1

<div>
   <img src="https://github.com/johnebere58/screenshots/blob/master/dialogpack_simple_list_multiple.gif" width="auto" height="400px" hspace="20"/>
</div>

 ```dart
     DialogManager.showSimpleListDialog(context,
                       items: [
                         "Apple", "Ball", "Cake"
                       ],
                       onItemSelected: (dynamic result){
                       showSnackBar(result);
                   }, maxSelections: 2);
```
The result will be a list of the items selected, if you set `returnIndexes` to true, the result will be a list of the indexes of the items selected





For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

