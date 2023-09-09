import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_app/controller/splash_controller.dart';
import 'package:ui_app/core/constants/app_fonts.dart';
import 'package:ui_app/core/constants/app_string.dart';
import 'package:ui_app/core/constants/app_text_styles.dart';


class SlidingText extends StatelessWidget {
  const SlidingText({super.key,});
  @override
  Widget build(BuildContext context) {
    Get.put(SplashControllerImpl());
    return GetBuilder<SplashControllerImpl>(
      builder: (controller) =>  AnimatedBuilder(
        builder: (context, child) => SlideTransition(
          position: controller.slidingAnimation,
          child:Column(
            children: [
              Text(
               AppString.kHomeAppBar.tr,
                style: AppTextStyles.textStyle20.copyWith(
                  fontFamily:AppFont.kFontSplash,
                ),
                textAlign: TextAlign.center,
              ),
             const SizedBox(
                height: 10.0,
              ),
              Text(
               AppString.kNameText,
                style: AppTextStyles.textStyle20.copyWith(
                  fontFamily:AppFont.kFontSplash,
                ),
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ),
        animation: controller.slidingAnimation,
      ),
    );
  }
}
