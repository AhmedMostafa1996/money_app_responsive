import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_app/core/constants/app_colors.dart';
import 'package:ui_app/core/constants/app_string.dart';
import 'package:ui_app/view/setting_screen/widget/BodySetting.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kColorAppbar,
        title:  Text(
          AppString.kSetting.tr,
        ),
      ),
      body:const BodySetting(),
    );
  }
}
