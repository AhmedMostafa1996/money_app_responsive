import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_app/controller/home_controller.dart';
import 'package:ui_app/core/constants/app_colors.dart';
import 'package:ui_app/core/constants/app_string.dart';
import 'package:ui_app/core/constants/routes.dart';

AppBar buildAppBar() {
  Get.put(HomeControllerImpl());
  return AppBar(
    backgroundColor: AppColor.kColorAppbar,
    title: Text(
      AppString.kHomeAppBar.tr,
    ),
    centerTitle: true,
    elevation: 0.0,
    actions: [
      IconButton(
        onPressed: () {
          Get.toNamed(AppRoutes.setting);
        },
        icon: const Icon(Icons.settings),
      ),
    ],
  );
}
