import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ui_app/core/constants/app_icon.dart';
import 'package:ui_app/core/constants/app_string.dart';
import 'package:ui_app/core/constants/constants.dart';
import 'package:ui_app/data/data_source/sqflite.dart';

abstract class PayController extends GetxController {
  insertData();
}

class PayControllerImpl extends PayController {

  late TextEditingController nameController;

  late TextEditingController priceController;

  DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void onInit() {
    nameController = TextEditingController();
    priceController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  insertData() {
    dbHelper.insertDatabase(
      nameDetails: nameController.text,
      date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      money: double.tryParse(priceController.text)!*-1,
      icon: AppIcon.kIcPayItem,
      details: AppString.kPay.tr,
      totalAmount: getTotal(priceController, -1),
    );
  }

  double getTotal(priceController, n) {
    if (ListData.information.isEmpty) {
      return double.tryParse(priceController.text)! * n;
    } else {
      double totalMoneyEntry = 0.0;
      for (var i in ListData.information) {
        totalMoneyEntry += i['money'];
      }
      totalMoneyEntry += (double.tryParse(priceController.text)! * n);
      return totalMoneyEntry;
    }
  }
}
