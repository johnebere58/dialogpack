import 'package:dialogpack/src/models/list_item.dart';

class ListDialogUtils{

static List<int> getSelectedIndexes(List listItems,List<String> selectedIds){
  List<int> selectedIndexes = [];
  for(int i=0;i<listItems.length;i++){
    ListItem listItem = listItems[i];
    if(selectedIds.contains(listItem.itemKey)){
      selectedIndexes.add(i);
    }
  }
  return selectedIndexes;
}

}