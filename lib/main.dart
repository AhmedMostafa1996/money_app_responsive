import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_app/core/services/services.dart';
import 'app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MoneyElHrameenApp());
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.blueGrey));
}

