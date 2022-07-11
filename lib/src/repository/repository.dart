
import 'package:dialogpack/src/blocs/check_box_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:dialogpack/src/blocs/message_dialog_controller.dart';

 GetIt getIt = GetIt.instance..allowReassignment = true;

 class Repository{

   static Repository get instance => getIt<Repository>();

   static startUp(){

     getIt.registerSingleton<Repository>(Repository());

     getIt.registerSingleton<MessageDialogController>(MessageDialogController());

     getIt.registerSingleton<CheckBoxController>(CheckBoxController());

   }

 }