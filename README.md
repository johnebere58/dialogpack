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
      messageDialogStyle: MessageDialogStyle(),
      dialogEntrance: DialogEntrance.fade_in,
      popupDialogStyle: PopupDialogStyle(),
      inputDialogStyle: InputDialogStyle(),
      listDialogStyle: ListDialogStyle(),
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

## Customizing a message dialog
You can use the `MessageDialogStyle` class the customize a message dialog



This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

