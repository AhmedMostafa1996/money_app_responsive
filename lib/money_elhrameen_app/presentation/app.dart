import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ui_app/money_elhrameen_app/domain/cubit/cubit.dart';
import 'package:ui_app/money_elhrameen_app/presentation/router/router.dart';
import 'package:ui_app/money_elhrameen_app/presentation/router/routes.dart';
import 'package:ui_app/money_elhrameen_app/presentation/ui/splash_views/view/splash_screen.dart';

class MoneyElHrameenApp extends StatelessWidget {
  const MoneyElHrameenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: GetMaterialApp(
        home: const SplashScreen(),
        getPages: AppRouter.router,
        initialRoute: AppRoutes.splash,
      ),
    );
  }
}
