import 'package:flutter/material.dart';
import 'package:ui_app/core/constants/app_colors.dart';
import 'package:ui_app/core/constants/app_image.dart';
import 'package:ui_app/view/splash_views/widget/sliding_text.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColor.kColorApp,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            AppImage.logoSplash,
            height:  250.0,
          ),
          const SlidingText(),
        ],
      ),
    );
  }

}
