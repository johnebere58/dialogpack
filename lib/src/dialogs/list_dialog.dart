import 'dart:ui';
import 'package:dialogpack/src/assets/color_assets.dart';
import 'package:dialogpack/src/blocs/check_box_controller.dart';
import 'package:dialogpack/src/utils/widget_utils.dart';
import 'package:dialogpack/src/utils/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:dialogpack/src/models/list_item.dart';
import 'package:dialogpack/src/models/list_type.dart';

class ListDialog extends StatefulWidget {
  final String? title;
  final Color? buttonColor;
  final List<ListItem> items;
  // final List<ListItem>? defaultSelections; /// for multiple selection list
  final ListType listType;
  final bool searchable;
  final int maxSelection; // for multiple list selection

  const ListDialog(this.items,
      {this.title,
        // this.defaultSelections,
        this.listType=ListType.normal,
        this.buttonColor,
        this.searchable=false,
        this.maxSelection = 1,
        Key? key}):super(key:key);

  @override
  ListDialogState createState() => ListDialogState();
}

class ListDialogState extends State<ListDialog> {

  late ListType listType;
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
    listType = widget.listType;
    allItems = widget.items;
    listItems = widget.items;

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
    return Stack(fit: StackFit.expand, children: <Widget>[
      GestureDetector(
        onTap: () {
          closePage((){ Navigator.pop(context);});
        },
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
      page()
    ]);
  }

  Widget page() {

    String? title = widget.title;
    Color buttonColor = widget.buttonColor ?? blackColor;

    return Center(
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: blackColor2,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if(title!=null)Padding(
                padding: const EdgeInsets.only(left: 20,top: 20),
                child: Text(title, style: textStyle(false, 16, blackColor),
                ),
              ),
              AnimatedContainer(duration: const Duration(milliseconds: 500),
                width: double.infinity,
                height: errorText.isEmpty?0:40,
                color: Colors.red,
                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                child:Center(child: Text(errorText,style: textStyle(true, 14, white),)),
              ),
              if(widget.searchable)Container(
                height: 45,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                    addSpaceWidth(10),
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
                        autofocus: true,
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
                        cursorColor: black,
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
                    if(showCancel)GestureDetector(
                      onTap: () {
                        setState(() {
                          showCancel = false;
                          _searchController.text = "";
                        });
                        performSearch();
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                        color: Colors.transparent,
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
              Flexible(fit: FlexFit.loose,
                child: Scrollbar(
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    itemBuilder: (context, position) {

                      ListItem listItem = allItems[position];
                      String? image = listItem.image;
                      IconData? icon = listItem.icon;
                      String title = listItem.title;
                      String? subtitle = listItem.subtitle;
                      Color titleColor = listItem.titleColor ?? blackColor;
                      Color subtitleColor = listItem.subtitleColor ?? blackColor2;
                      Color iconOrImageColor = listItem.iconOrImageColor ?? blackColor2;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          position == 0
                              ? Container()
                              : customDivider(),
                          GestureDetector(
                            onTap: () {

                              handleSelection(position);

                              if(listType==ListType.normal){
                                Navigator.of(context).pop(selectedIds);
                              }

                            },
                            child: Container(
                              color: whiteColor,
                              width: double.infinity,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 15, 0, 15),
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
                                                 size: 20,
                                                 color: iconOrImageColor,
                                               )
                                                     :Image.asset(
                                               image!,
                                               width: 20,
                                               height: 20,
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
                                            margin: const EdgeInsets.only(top: 5),
                                            child: Text(
                                              subtitle,
                                              style: textStyle(
                                                  false, 13, subtitleColor),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),

                                    if(listType==ListType.multipleSelection)Container(
                                      margin: const EdgeInsets.only(left: 5),
                                      child: CustomCheckBox(
                                        onChecked: (b){
                                          handleSelection(position);
                                        },
                                        defaultValue: selectedIds.contains(listItem.itemKey),
                                        key: ValueKey(listItem.itemKey),
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
                    itemCount: widget.items.length,
                    shrinkWrap: true,
                  ),
                ),
              ),
              if ((listType!=ListType.normal) && selectedIds.isNotEmpty)
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
//                      width: double.infinity,
                      height: 40,
                      margin: const EdgeInsets.all(10),
                      child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            backgroundColor: buttonColor,
                          ),
                          onPressed: () {
                            closePage((){ Navigator.pop(context,selectedIds);});
                          },
                          child: Text(
                            "OK",
                            style: textStyle(true, 16, whiteColor),
                          ))),
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
      if(widget.maxSelection==1){
        selectedIds.clear();
      }else if(selectedIds.length >= widget.maxSelection){
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
    Future.delayed(const Duration(milliseconds: 100),(){
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
