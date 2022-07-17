
import 'dart:async';

import 'package:dialogpack/src/assets/string_assets.dart';
import 'package:dialogpack/src/repository/repository.dart';

class LoadingController {

  static LoadingController get instance => getIt<LoadingController>();

  final StreamController<dynamic> streamController = StreamController.broadcast();

  Stream<dynamic> get stream => streamController.stream;


 }