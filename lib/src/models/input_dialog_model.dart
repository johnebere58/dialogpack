
import 'package:dialogpack/src/models/input_dialog_style.dart';
import 'package:dialogpack/src/models/input_item.dart';

class InputDialogModel{

  final String? title;
  final List<InputItem> inputItems;// for multiple list selection
  final String buttonText;
  final InputDialogStyle? inputDialogStyle;
  final bool inheritStyle;

  InputDialogModel({
    required this.inputItems,
    this.title,
    this.buttonText="Ok",
    this.inputDialogStyle,
    this.inheritStyle=false
});
}