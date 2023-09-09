import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ui_app/core/constants/routes.dart';
import 'package:ui_app/core/services/services.dart';

 abstract class SplashController extends  GetxController{

  initSlidingAnimation();

  navigationToHome();

}
class SplashControllerImpl extends SplashController with GetSingleTickerProviderStateMixin{

   //Variable
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  MyServices myServices=Get.find();

   //Logic
  @override
  initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 7), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  @override
  navigationToHome() {
    Future.delayed(
      const Duration(seconds: 5),
          () {
        if(myServices.sharedPreferences.containsKey('lang')){
          Get.offAllNamed(AppRoutes.home);
        }else{
          Get.offAllNamed(AppRoutes.lang);
        }
      },
    );
  }

  //Method
  @override
  void onInit() {
    initSlidingAnimation();
    navigationToHome();
    super.onInit();
  }


  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}