# Dialog Pack

[![Dart](https://github.com/johnebere58/dialogpack/actions/workflows/dart.yml/badge.svg?branch=master)](https://github.com/johnebere58/dialogpack/actions/workflows/dart.yml)

A powerful plugin for displaying message dialogs, list dialogs, success dialogs, failed dialogs,
 input dialogs, popup dialogs and loading dialogs. This plugin is fully customizable with examples

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

Add this following to the `initState` method of your root widget
Instantiate the game instance by call `DialogManager.initialize()`
```dart
import 'package:dialogpack/dialogpack.dart';

  @override
  void initState() {
    DialogManager.initialize();
    super.initState();
  }
```
Optionally You can choose to set a global style for your dialogs during initialization,
you can also choose to use a dark themed dialog 
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
      useDarkMode: useDarkMode,
    );
   
   }
```
Everything is flexible on the go, 
you can switch theme styles or switch from dark theme to light theme
 ```dart
     DialogManager.switchToLightMode();
     DialogManager.switchToDarkMode\();
```

## Showing a Message Dialog
To display a message dialog is very easy
use the `MessageDialogModel` class to set properties of the dialog
optionally use the `MessageDialogStyle` class to style the dialog
you can also choose to use the default dialog style set in the 
`DialogManager.initialized()` method

 ```dart
    DialogManager.showMessageDialog(context,
                               messageDialogModel: MessageDialogModel(
                                   title: "Welcome",
                                   message: "This is a very simple dialog",
                               messageDialogStyle: MessageDialogStyle(
                                 titleTextColor: Colors.black,
                                 titleTextSize: 20.0
                               
                               )));

```

## Customizing a message dialog
You can use the MessageDialogStyle class the customize a message dialog


This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

