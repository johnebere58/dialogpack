
import 'package:dialogpack/src/models/list_dialog_style.dart';
import 'package:dialogpack/src/models/list_item.dart';

class ListDialogModel{

  final String? title;
  final List<ListItem> listItems;
  final bool searchable;
  final int maxSelection; // for multiple list selection
  final String buttonText;
  final ListDialogStyle? listDialogStyle;
  final bool inheritStyle;

  ListDialogModel({
    required this.listItems,
    this.title,
    this.searchable=false,
    this.maxSelection=1,
    this.buttonText="Ok",
    this.listDialogStyle,
    this.inheritStyle=false
});
}