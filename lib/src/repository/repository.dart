
import 'package:get_it/get_it.dart';
import 'package:simpledialog/src/blocs/message_dialog_controller.dart';

 GetIt getIt = GetIt.instance..allowReassignment = true;

 class Repository{

   static Repository get instance => getIt<Repository>();

   static startUp(){

     getIt.registerSingleton<Repository>(Repository());

     getIt.registerSingleton<MessageDialogController>(MessageDialogController());

   }

 }