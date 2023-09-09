import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_app/controller/pay_controller.dart';
import 'package:ui_app/core/constants/app_string.dart';
import 'package:ui_app/core/shared/money_entry_screen.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    PayControllerImpl controller =Get.put(PayControllerImpl());
    return MoneyEntryScreen(
      namePage: AppStringEn.kPayEntry.tr,
      askingForMoneyQuestion: AppString.kAskingPay.tr,
      moneyDetailsQuestion: AppString.kDetailsPay.tr,
      nameController: controller.nameController,
      priceController: controller.priceController,
      onPressed: () {
        controller.insertData();
      },
      detailsController: controller.nameController,
      details: false,
    );
  }
}

