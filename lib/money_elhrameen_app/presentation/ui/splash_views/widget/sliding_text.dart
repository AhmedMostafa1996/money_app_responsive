import 'package:flutter/material.dart';
import '../../../../shared/utils/app_fonts.dart';
import '../../../../shared/utils/app_string.dart';
import '../../../../shared/utils/app_text_styles.dart';


class SlidingText extends StatelessWidget {
  const SlidingText({super.key, required this.slidingAnimation});
  final Animation<Offset> slidingAnimation;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) => SlideTransition(
        position: slidingAnimation,
        child:Text(
         AppString.kAnimationSplash,
          style: AppTextStyles.textStyle20.copyWith(
            fontFamily:AppFont.kFontSplash,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      animation: slidingAnimation,
    );
  }
}
