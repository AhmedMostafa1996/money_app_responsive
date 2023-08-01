import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'money_elhrameen_app/domain/cubit/bloc_observer.dart';
import 'money_elhrameen_app/presentation/app.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MoneyElHrameenApp());
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.blueGrey));

}

