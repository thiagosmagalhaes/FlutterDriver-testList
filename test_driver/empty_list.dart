import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutterdriver_test_list/utils/empty_list.dart';

void main() {
  enableFlutterDriverExtension();
  runApp(MaterialApp(home: MyEmptyList()));
}
