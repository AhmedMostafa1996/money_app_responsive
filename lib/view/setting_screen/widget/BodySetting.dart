import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_app/core/constants/app_fonts.dart';
import 'package:ui_app/core/constants/app_icon.dart';
import 'package:ui_app/core/constants/app_string.dart';
import 'package:ui_app/core/constants/constants.dart';
import 'package:ui_app/core/function/alert_chosse_language.dart';
import 'package:ui_app/core/function/alert_delete_app.dart';

class BodySetting extends StatelessWidget {
  const BodySetting({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Text(
                  AppString.kDeleteData.tr,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppFont.kFontSplash,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: SvgPicture.asset(
                    AppIcon.kDelete,
                  ),
                  iconSize: 60.0,
                  onPressed: () {
                    if (ListData.information.isNotEmpty) {
                      alertDeleteApp();
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Text(
                  AppString.kChooseLang.tr,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppFont.kFontSplash,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: SvgPicture.asset(
                    AppIcon.kLang,
                  ),
                  iconSize: 70.0,
                  onPressed: () {
                    alertChooseLanguageApp();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
