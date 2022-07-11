
import 'package:flutter/material.dart';
import 'package:dialogpack/src/dialog_manager.dart';

Color get whiteColor =>DialogManager.darkMode?black:white;

Color get whiteColor2 => DialogManager.darkMode?dark_grey_two:white;

Color get whiteColor3 => DialogManager.darkMode?dark_grey_two:default_white;

Color get blackColor=> DialogManager.darkMode?white:black;

Color get blackColor2 => DialogManager.darkMode?white:warm_grey_two;

double get bestOpacity => DialogManager.darkMode?(.5):(.1);

double get bestOpacity2 => DialogManager.darkMode?(.3):(.03);

const Color black = Color(0xff000000);
const Color white = Color(0xffffffff);
const Color white1 = Color(0xfffafafa);
const Color transparent = Color(0xff00000000);
const Color default_white = Color(0xfffff3f3f3);
const Color dark_gray = Color(0xff282a2b);
const Color dark_grey_two = Color(0xff191a1b);
const Color warm_grey = Color(0xff7f7f7f);
const Color warm_grey_two = Color(0xff9c9c9c);
const Color warm_grey_three = Color(0xff8b8b8b);
const Color warm_grey_four = Color(0xff979797);