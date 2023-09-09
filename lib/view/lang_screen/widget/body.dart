import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ui_app/core/constants/app_colors.dart';
import 'package:ui_app/core/constants/app_fonts.dart';
import 'package:ui_app/core/constants/app_string.dart';
import 'package:ui_app/core/constants/app_text_styles.dart';
import 'package:ui_app/core/localization/change_translation.dart';

class LanguageScreenBody extends StatelessWidget {
  const LanguageScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocaleController controller = Get.put(MyLocaleController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppString.kChooseLang.tr,
          style: AppTextStyles.textStyle60.copyWith(
            color: AppColor.kColorAppbar,
            fontFamily: AppFont.kFontSplash,
            fontSize: 40.0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                GestureDetector(
                  child: SvgPicture.asset(
                    'assets/icon/egypt.svg',
                    height: 150.0,
                  ),
                  onTap: () {
                    controller.changeLocale(AppString.kAr);
                  },
                ),
                Text(
                  AppString.kEgypt.tr,
                  style: AppTextStyles.textStyle20.copyWith(
                    color: AppColor.kColorAppbar,
                    fontFamily: AppFont.kFontSplash,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 25.0,
            ),
            Column(
              children: [
                GestureDetector(
                  child: SvgPicture.asset(
                    'assets/icon/england.svg',
                    height: 150.0,
                  ),
                  onTap: () {
                    controller.changeLocale(AppString.kEn);
                  },
                ),
                Text(
                  AppString.kEnglish.tr,
                  style: AppTextStyles.textStyle20.copyWith(
                    color: AppColor.kColorAppbar,
                    fontFamily: AppFont.kFontSplash,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
