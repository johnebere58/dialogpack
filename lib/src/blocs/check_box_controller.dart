
import 'dart:async';
import 'package:dialogpack/src/models/check_box_model.dart';
import 'package:dialogpack/src/repository/repository.dart';

class CheckBoxController {

  static CheckBoxController get instance => getIt<CheckBoxController>();

  final StreamController<CheckBoxModel> _streamController = StreamController.broadcast();

  Stream<CheckBoxModel> get stream => _streamController.stream;

  void check({required String id})=> _streamController.add(CheckBoxModel(id: id, check: true));

  void uncheck({required String id})=> _streamController.add(CheckBoxModel(id: id, check: false));

 }