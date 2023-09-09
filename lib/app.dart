import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_app/core/localization/change_translation.dart';
import 'package:ui_app/core/localization/translation.dart';
import 'package:ui_app/router.dart';

class MoneyElHrameenApp extends StatelessWidget {
  const MoneyElHrameenApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocaleController controller=Get.put(MyLocaleController());
    return  GetMaterialApp(
      getPages: AppRouter.router,
      translations: MyTranslation(),
      locale: controller.locale,
    );
  }
}
