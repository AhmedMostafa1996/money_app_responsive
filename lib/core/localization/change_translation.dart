import 'dart:ui';
import 'package:get/get.dart';
import 'package:ui_app/core/constants/routes.dart';
import 'package:ui_app/core/services/services.dart';

class MyLocaleController extends GetxController{

  late Locale locale;
  MyServices myServices= Get.find();

  void changeLocale(String languageCode){
    locale=Locale(languageCode);
    myServices.sharedPreferences.setString('lang', languageCode);
    Get.updateLocale(locale);
    Get.offAllNamed(AppRoutes.home);
  }

  Locale getLocale(){
    if(!myServices.sharedPreferences.containsKey('lang')){
    return locale=Get.deviceLocale!;
    }
    else if((myServices.sharedPreferences.getString('lang')!)=='en'){
      return locale=const Locale('en');
    }else {
     return locale=const Locale('ar');
    }
  }


  @override
  void onInit() {
    super.onInit();
    getLocale();
  }
}