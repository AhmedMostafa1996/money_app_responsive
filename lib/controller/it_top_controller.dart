import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ui_app/core/constants/app_icon.dart';
import 'package:ui_app/core/constants/constants.dart';
import 'package:ui_app/data/data_source/sqflite.dart';

abstract class ItTopController extends GetxController {
  insertData();
}

class ItTopControllerImpl extends ItTopController {
  late TextEditingController nameController;

  late TextEditingController priceController;

  late TextEditingController detailsController;

  DatabaseHelper dbHelper = DatabaseHelper();

  @override
  void onInit() {
    nameController = TextEditingController();
    priceController = TextEditingController();
    detailsController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    detailsController.dispose();
    super.dispose();
  }

  @override
  insertData() {
    dbHelper.insertDatabase(
      nameDetails: nameController.text,
      date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      money: double.tryParse(priceController.text)!,
      icon: AppIcon.kIcTopUpItem,
      details: detailsController.text,
      totalAmount: getTotal(priceController, 1),
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
