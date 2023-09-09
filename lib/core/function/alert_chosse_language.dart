import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_app/core/constants/app_colors.dart';
import 'package:ui_app/core/constants/app_fonts.dart';
import 'package:ui_app/core/constants/app_string.dart';
import 'package:ui_app/core/constants/app_text_styles.dart';
import 'package:ui_app/core/localization/change_translation.dart';

Future<bool> alertChooseLanguageApp(){
  MyLocaleController controller = Get.find();
  Get.defaultDialog(
    title: AppString.kLanguage.tr,
    middleText: AppString.kChooseLang.tr ,
    confirm: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                child: SvgPicture.asset(
                  'assets/icon/egypt.svg',
                  height: 150.0,
                ),
                onTap: () {
                  controller.changeLocale(AppString.kAr);
                  Get.back();
                },
              ),
              const SizedBox(
                width: 25.0,
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
          Row(
            children: [
              GestureDetector(
                child: SvgPicture.asset(
                  'assets/icon/england.svg',
                  height: 150.0,
                ),
                onTap: () {
                  controller.changeLocale(AppString.kEn);
                  Get.back();
                },
              ),
              const SizedBox(
                width: 25.0,
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
  );
  return Future.value(true);
}