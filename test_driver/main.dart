import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutterdriver_test_list/main.dart';

void main() {
  enableFlutterDriverExtension();
  runApp(MaterialApp(home: MyApp()));
}
