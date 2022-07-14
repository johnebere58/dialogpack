
 import 'package:dialogpack/src/models/dialog_placement.dart';

class DialogStyle{

   final String? appBanner;
   final double curvedRadius;
   final double elevation;
   final DialogPlacement dialogPlacement;
   final double margin;

   const DialogStyle({this.appBanner,
     this.curvedRadius=15.0,
     this.elevation=5.0,
     this.dialogPlacement=DialogPlacement.center,
     this.margin=40.0
   });

}