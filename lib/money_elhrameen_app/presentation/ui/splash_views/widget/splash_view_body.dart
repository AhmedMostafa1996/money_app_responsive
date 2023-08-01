import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_app/money_elhrameen_app/presentation/ui/splash_views/widget/sliding_text.dart';
import 'package:ui_app/money_elhrameen_app/shared/utils/app_image.dart';
import '../../../../shared/utils/app_colors.dart';
import '../../../router/routes.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slidingAnimation;

  @override
  void initState() {
    super.initState();
    _initSlidingAnimation();
     _navigationToHome();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

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
          SlidingText(slidingAnimation: _slidingAnimation),
        ],
      ),
    );
  }

  void _initSlidingAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );
    _slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 7), end: Offset.zero)
            .animate(_animationController);
    _animationController.forward();
  }

  void _navigationToHome() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Get.offAllNamed(AppRoutes.home);
      },
    );
  }
}
