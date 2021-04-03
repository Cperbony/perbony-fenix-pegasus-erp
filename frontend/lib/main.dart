import 'package:flutter/material.dart';
import 'package:mvc_application/view.dart';
import 'package:perboni_erp_fenix/src/view/perboni_erp_fenix_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends App {
  // This widget is the root of your application.
  @override
  @override
  AppView createView() => PerboniErpFenixApp();
}
