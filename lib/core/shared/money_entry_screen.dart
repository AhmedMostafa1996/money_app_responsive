import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_app/core/constants/app_colors.dart';
import 'package:ui_app/core/constants/app_string.dart';
import 'package:ui_app/core/constants/app_text_styles.dart';
import 'default_text_filed.dart';

class MoneyEntryScreen extends StatelessWidget {
  MoneyEntryScreen({
    super.key,
    required this.askingForMoneyQuestion,
    required this.moneyDetailsQuestion,
    required this.onPressed,
    required this.nameController,
    required this.priceController,
    required this.namePage,
    required this.detailsController, required this.details,
  });

  final String namePage;

  final String askingForMoneyQuestion;
  final String moneyDetailsQuestion;
  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController detailsController;
  final bool details;
  final VoidCallback onPressed;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStringEn.kMoneyApp),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        decoration: const BoxDecoration(gradient: AppColor.kColorApp),
        height: size.height,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  namePage,
                  style: AppTextStyles.textStyle25,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                DefaultTextFiled(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return AppStringAr.kErrorTextFiled;
                    }
                    return null;
                  },
                  keyboard: TextInputType.number,
                  controller: priceController,
                  detailsQuestion: askingForMoneyQuestion,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                DefaultTextFiled(
                  validator: (String value) {
                    if (value.isEmpty) {
                      return AppStringAr.kErrorTextFiled;
                    }
                    return null;
                  },
                  keyboard: TextInputType.text,
                  controller: nameController,
                  detailsQuestion: moneyDetailsQuestion,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                details==false?const SizedBox(height: 5.0,):DefaultTextFiled(
                  controller: detailsController,
                  detailsQuestion: AppString.kDetails.tr,
                  keyboard: TextInputType.text,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return AppStringAr.kErrorTextFiled;
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.kColorButton,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        onPressed();
                      }
                    },
                    child:  Text(
                      AppString.kEntry.tr,
                      style: AppTextStyles.textStyle30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
