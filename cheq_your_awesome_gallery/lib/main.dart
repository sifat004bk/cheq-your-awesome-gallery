import 'package:cheq_your_awesome_gallery/core/di/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'core/yag_app.dart';

void main() {
  configureServiceLocator();
  runApp(const YAGApp());
}
