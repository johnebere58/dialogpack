import 'dart:ui';
import 'package:dialogpack/src/assets/color_assets.dart';
import 'package:dialogpack/src/blocs/check_box_controller.dart';
import 'package:dialogpack/src/dialog_manager.dart';
import 'package:dialogpack/src/models/dialog_placement.dart';
import 'package:dialogpack/src/models/dialog_style.dart';
import 'package:dialogpack/src/models/list_dialog_model.dart';
import 'package:dialogpack/src/models/list_dialog_style.dart';
import 'package:dialogpack/src/utils/screen_utils.dart';
import 'package:dialogpack/src/utils/widget_utils.dart';
import 'package:dialogpack/src/utils/widgets/custom_check_box.dart';
import 'package:dialogpack/src/utils/widgets/list_dialog_button.dart';
import 'package:flutter/material.dart';
import 'package:dialogpack/src/models/list_item.dart';

class ListDialog extends StatefulWidget {

  final ListDialogModel listDialogModel;
  const ListDialog({required this.listDialogModel, Key? key}):super(key:key);

  @override
  ListDialogState createState() => ListDialogState();
}

class ListDialogState extends State<ListDialog> {

  late ListDialogModel listDialogModel;
  late List<ListItem> allItems;
  late List<ListItem> listItems;
  final List<String> selectedIds = [];
  bool showBack=false;
  bool hideUI=true;

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool showCancel = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listDialogModel = widget.listDialogModel;
    List items = listDialogModel.listItems;
    allItems = List.from(items);
    listItems = List.from(items);

    Future.delayed(const Duration(milliseconds: 200),(){
      hideUI=false;
      setState(() {});
    });
    Future.delayed(const Duration(milliseconds: 500),(){
      showBack=true;
      setState(() {});
    });

    _focusNode.addListener(() {
      if(mounted)setState(() {});
    });
  }

  void performSearch()async{
    listItems.clear();
    setState(() {});
    String search = _searchController.text.toLowerCase().trim();

    for(ListItem listItem in allItems){
      String title = listItem.title;
      String subtitle = listItem.subtitle ?? "";
      String fullText = "$title$subtitle".toLowerCase().trim();
      if(search.isNotEmpty && !fullText.contains(search))continue;
      listItems.add(listItem);
    }

    if(mounted)setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand,alignment: Alignment.center,
        children: <Widget>[
      GestureDetector(
        onTap: () {
          closePage((){ Navigator.pop(context);});
        },
        key: const ValueKey("tapToClose"),
        child: AnimatedOpacity(
          opacity: showBack?1:0,duration: const Duration(milliseconds: 300),
          child: ClipRect(
              child:BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                  child: Container(
                    color: Colors.black.withOpacity(.7),
                  ))
          ),
        ),
      ),
          SafeArea(child: page()),
    ]);
  }

  Widget page() {

    //The list dialog style
    ListDialogStyle listDialogStyle = listDialogModel.listDialogStyle ?? DialogManager.defaultListDialogStyle;
    if(listDialogModel.inheritStyle) {
      listDialogStyle = listDialogStyle.inherit(DialogManager.defaultListDialogStyle);
    }
    else{
      listDialogStyle = listDialogStyle.inherit(ListDialogStyle());
    }

    String? title = listDialogModel.title;
    Color buttonColor = listDialogStyle.buttonColor ?? blackColor;
    Color titleColor = listDialogStyle.titleTextColor ?? blackColor;

    //The dialog style
    DialogStyle dialogStyle = listDialogStyle.dialogStyle!;
    // String? appBanner = dialogStyle.appBanner;
    double curvedRadius = dialogStyle.curvedRadius;
    double elevation = dialogStyle.elevation;
    DialogPlacement dialogPlacement = dialogStyle.dialogPlacement;
    double margin = dialogStyle.margin;
    double itemSpacing = listDialogStyle.itemSpacing!;

    return Align(
      alignment: dialogPlacement == DialogPlacement.top
          ? Alignment.topCenter
          : dialogPlacement == DialogPlacement.bottom
          ? Alignment.bottomCenter
          : Alignment.center,
      child: Container(
        margin: EdgeInsets.fromLTRB(
            margin,
            margin,
            margin,
            margin),
        width: getScreenWidth(context)>500?500:getScreenWidth(context),
        child: Card(
          clipBehavior: Clip.antiAlias,margin: EdgeInsets.zero,
          color: whiteColor,
          elevation: elevation,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(curvedRadius)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              AnimatedContainer(duration: const Duration(milliseconds: 500),
                width: double.infinity,
                height: errorText.isEmpty?0:40,
                color: Colors.red,
                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                child:Center(child: Text(errorText,style: textStyle(true, 14, white),)),
              ),
              if(title!=null)Padding(
                padding: EdgeInsets.fromLTRB(20,itemSpacing + 10,20,0),
                child: Text(title, style: textStyle(true, listDialogStyle.titleTextSize!, titleColor),
                ),
              ),
              if(listDialogModel.searchable)Container(
                height: 45,
                margin: EdgeInsets.fromLTRB(0, itemSpacing, 0, 0),
                // decoration: BoxDecoration(
                //     color: white.withOpacity(.8),
                //     borderRadius: BorderRadius.circular(25),
                //     border: Border.all(color: focusSearch.hasFocus?
                //     black:black.withOpacity(.1),
                //         width: focusSearch.hasFocus?2:1)
                // ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    addSpaceWidth(20),
                    Icon(
                      Icons.search,
                      color: blackColor2,
                      size: 17,
                    ),
                    addSpaceWidth(10),

                    Flexible(
                      flex: 1,
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        textCapitalization: TextCapitalization.sentences,
                        autofocus: false,
                        onSubmitted: (_) {
                          performSearch();
                        },
                        decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: textStyle(
                              false,
                              18,
                              blackColor.withOpacity(.5),
                            ),
                            border: InputBorder.none,isDense: true),
                        style: textStyle(false, 16, black),
                        controller: _searchController,
                        cursorColor: blackColor,
                        cursorWidth: 2,
                        focusNode: _focusNode,
                        keyboardType: TextInputType.text,
                        onChanged: (s) {
                          showCancel = s.trim().isNotEmpty;
                          setState(() {});
                          performSearch();
                        },
                      ),
                    ),
                    if(showCancel)Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                      color: Colors.transparent,
                      height: 22,width: 22,
                      child: TextButton(
                        onPressed: (){
                          setState(() {
                            showCancel = false;
                            _searchController.text = "";
                          });
                          performSearch();
                        },
                        style: TextButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: EdgeInsets.zero
                        ),
                        child: Icon(
                          Icons.close,
                          color: blackColor,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              if(!listDialogModel.searchable)addSpace(itemSpacing),
              Flexible(fit: FlexFit.loose,
                child: Scrollbar(
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    itemBuilder: (context, position) {

                      ListItem listItem = listItems[position];
                      String? image = listItem.image;
                      IconData? icon = listItem.icon;
                      String title = listItem.title;
                      String? subtitle = listItem.subtitle;
                      Color titleColor = listItem.titleColor ?? blackColor;
                      Color subtitleColor = listItem.subtitleColor ?? blackColor2;
                      Color iconOrImageColor = listItem.iconOrImageColor ?? blackColor;
                      double iconSize = subtitle==null?18:25;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          position == 0 || !listDialogStyle.showButtonDivider!
                              ? Container()
                              : customDivider(),
                          GestureDetector(
                            onTap: () {

                              handleSelection(position);

                              if(listDialogModel.maxSelection==1){
                               closePage((){ Navigator.of(context).pop(selectedIds);});
                              }

                            },
                            child: Container(
                              color: whiteColor,
                              width: double.infinity,
                              child: Padding(
                                padding:
                                     EdgeInsets.fromLTRB(0, itemSpacing, 0, itemSpacing),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: <Widget>[
                                    (icon!=null || image!=null)?(
                                             Container(
                                               margin:
                                               const EdgeInsets.only(right: 10),
                                               child:
                                               icon!=null? Icon(
                                                 icon,
                                                 size: iconSize,
                                                 color: iconOrImageColor,
                                               )
                                                     :Image.asset(
                                               image!,
                                               width: iconSize,
                                               height: iconSize,
                                               color: iconOrImageColor,
                                             ),
                                             )
                                   ):Container(),
                                    Flexible(
                                      flex:1,fit:FlexFit.tight,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            title,
                                            style: textStyle(
                                                false, 16, titleColor),
                                          ),
                                          if(subtitle!=null)Container(
                                            margin: const EdgeInsets.only(top: 3),
                                            child: Text(
                                              subtitle,
                                              style: textStyle(
                                                  false, 13, subtitleColor),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),

                                    if(listDialogModel.maxSelection>1)Container(
                                      margin: const EdgeInsets.only(left: 5),
                                      child: CustomCheckBox(
                                        onChecked: (b){
                                          handleSelection(position);
                                        },
                                        defaultValue: selectedIds.contains(listItem.itemKey),
                                        key: ValueKey(listItem.itemKey),
                                        // size: ,
                                        checkColor: listDialogStyle.globalCheckBoxColor ?? listItem.checkBoxColor,
                                      )
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: listItems.length,
                    shrinkWrap: true,
                  ),
                ),
              ),

                AnimatedContainer(duration:const Duration(milliseconds: 500),
                   width: double.infinity,
                    height: (listDialogModel.maxSelection>1 && selectedIds.isNotEmpty)?(
                        listDialogStyle.buttonSpacing! + listDialogStyle.dialogButtonHeight!
                    ):0,
                    margin:  EdgeInsets.fromLTRB(0,itemSpacing,0,0),
                    child:
    ListDialogButton(listDialogStyle: listDialogStyle,listDialogModel: listDialogModel,
    buttonClick: (){
      closePage((){ Navigator.pop(context,selectedIds);});
    },)
                  )
              //gradientLine(alpha: .1)
            ],
          ),
        ),
      ),
    );
  }

  void handleSelection(int position){
    ListItem item = allItems[position];
    String valueKey = item.itemKey;
    bool selected = selectedIds.contains(valueKey);
    if(selected){
      selectedIds.remove(valueKey);
      CheckBoxController.instance.uncheck(id: valueKey);
    }else{
      if(listDialogModel.maxSelection==1){
        selectedIds.clear();
      }else if(selectedIds.length >= listDialogModel.maxSelection){
        CheckBoxController.instance.uncheck(id: valueKey);
        showError("Max selection reached");
        return;
      }
      CheckBoxController.instance.check(id: valueKey);
      selectedIds.add(valueKey);
    }
    if(mounted)setState(() {});
  }

  closePage(onClosed){
    showBack=false;
    setState(() {

    });
    Future.delayed(const Duration(milliseconds: 300),(){
      Future.delayed(const Duration(milliseconds: 100),(){
        hideUI=true;
        setState(() {});
      });
      onClosed();
    });
  }

  String errorText = "";
  showError(String text){

    errorText=text;
    setState(() {});

    Future.delayed(const Duration(seconds: 1),(){
      errorText="";
      setState(() {});

    });
  }
}
