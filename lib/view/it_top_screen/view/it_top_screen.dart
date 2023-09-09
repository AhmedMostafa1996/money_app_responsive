import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_app/controller/it_top_controller.dart';
import 'package:ui_app/core/constants/app_string.dart';
import 'package:ui_app/core/shared/money_entry_screen.dart';

class ItTopScreen extends StatelessWidget {
  const ItTopScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ItTopControllerImpl controller =Get.put(ItTopControllerImpl());
    return MoneyEntryScreen(
      namePage: AppString.kEntryTookScreen.tr,
      askingForMoneyQuestion: AppString.kAskingTookMoney.tr,
      moneyDetailsQuestion: AppString.kNameTookMoney.tr,
      nameController: controller.nameController,
      priceController: controller.priceController,
      detailsController: controller.detailsController,
      onPressed: () {
        controller.insertData();
      },
      details: true,
    );
  }
}

