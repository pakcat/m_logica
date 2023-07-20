import 'package:flutter/material.dart';
import 'package:m_logica/app/app.dart';
import 'package:m_logica/app/core/base/base_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BaseController.init();
  runApp(const MLogicaApp());
}
