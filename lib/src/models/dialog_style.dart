
 import 'package:dialogpack/src/models/dialog_entrance.dart';
import 'package:dialogpack/src/models/dialog_placement.dart';

class DialogStyle{

   // final String? appBanner;
   final double curvedRadius;
   final double elevation;
   final DialogPlacement dialogPlacement;
   // final DialogEntrance dialogEntrance;
   final double margin;

   const DialogStyle({//this.appBanner,
     this.curvedRadius=15.0,
     this.elevation=5.0,
     this.dialogPlacement=DialogPlacement.center,
     this.margin=40.0,
     // this.dialogEntrance=DialogEntrance.scale
   });

}