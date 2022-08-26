import 'dart:async';
import 'dart:ui';
import 'package:dialogpack/src/blocs/loading_controller.dart';
import 'package:dialogpack/src/utils/base_utils.dart';
import 'package:flutter/material.dart';


class LoadingDialog extends StatefulWidget {
  final String message;
  final bool cancelable;
  LoadingDialog(
      {this.message="", this.cancelable = false,});
  @override
  _LoadingDialogState createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {

  late String message;
  late bool cancelable;
  late StreamSubscription sub;

  bool showBack=false;
  bool hideUI=true;
  bool hidePro=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    message=widget.message;
    cancelable = widget.cancelable;
    sub = LoadingController.instance.stream.listen((_) {
      if(_==false) {
        closePage((){ Navigator.pop(context);});
      }else{
        if(_ is String){
          message=_;
          setState(() {});
        }
      }
    });

    Future.delayed(const Duration(milliseconds: 200),(){
      hideUI=false;
      if(mounted)setState(() {});
    });
    Future.delayed(const Duration(milliseconds: 500),(){
      showBack=true;
      if(mounted)setState(() {});
    });
    Future.delayed(const Duration(milliseconds: 3000),(){
      hidePro=true;
      if(mounted)setState((){});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    sub.cancel();
  }


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      child: Stack(fit: StackFit.expand, children: <Widget>[
        AnimatedOpacity(
          opacity: hideUI?0:showBack?1:0,duration: const Duration(milliseconds: 300),
          child: ClipRect(
              child:BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                  child: Container(
                    color: Colors.black.withOpacity(.7),
                  ))
          ),
        ),
        page(),

      ]),
      onWillPop: () {
        if (cancelable)closePage((){ Navigator.pop(context);});
        return Future.value(false);
      },
    );
  }

  page() {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[

        Center(
            child:Container(
              margin: const EdgeInsets.only(bottom: 60),
              child:
              Container(
              width: 40,
              height:40,
              decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white,width: 2)
              ),
              // margin: EdgeInsets.only(bottom: 2,left: 2.5,),
              child:
              const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
              strokeWidth: 2,
              ))

            )
        ),

        // Center(
        //   child:
        //   Container(
        //
        //       width: 40,height: 40,
        //       margin: EdgeInsets.only(bottom: 58,left: 78),
        //       child:CircularProgressIndicator(
        //         valueColor: AlwaysStoppedAnimation(white),
        //         strokeWidth: 3,
        //       )),
        // ),

        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                 message??"",
                style: textStyle(false, 16, Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            if(cancelable)GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20,0,20,20),
                  width: 50,
                  height: 50,
                  child: Center(
                      child: Icon(
                        Icons.cancel,
                        color: Colors.white.withOpacity(.5),
                        size: 35,
                      )),
                ))
          ],
        ),
      ],
    );
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
}
