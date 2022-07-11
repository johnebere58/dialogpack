
import 'dart:async';

import 'package:dialogpack/src/assets/string_assets.dart';
import 'package:dialogpack/src/repository/repository.dart';

class MessageDialogController {

  static MessageDialogController get instance => getIt<MessageDialogController>();

  final StreamController<String?> _streamController = StreamController.broadcast();

  Stream<String?> get stream => _streamController.stream;

  void hideDialog({String? dialogKey=DEFAULT_MESSAGE_DIALOG_ID})=> _streamController.add(dialogKey);

 }