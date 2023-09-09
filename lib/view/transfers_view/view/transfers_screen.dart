import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_app/controller/transfers_controller.dart';
import 'package:ui_app/core/constants/app_colors.dart';
import 'package:ui_app/core/constants/app_string.dart';
import 'package:ui_app/core/constants/app_text_styles.dart';
import 'package:ui_app/core/shared/default_text_filed.dart';

class TransfersScreen extends StatelessWidget {
  TransfersScreen({super.key});

  final GlobalKey<FormState> formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    TransfersControllerImpl controller=Get.put(TransfersControllerImpl());
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStringEn.kMoneyApp),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.kColorAppbar,
      ),
      body: Container(
        height: size.height,
        decoration:const BoxDecoration(
          gradient:AppColor.kColorApp,
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                  AppString.kEntryTax.tr,
                  style:AppTextStyles.textStyle25
              ),
              DefaultTextFiled(
                validator: (String value){
                  if(value.isEmpty){
                    return AppStringEn.kErrorTextFiled.tr;
                  }
                  return null;
                },
                controller: controller.priceController,
                keyboard: TextInputType.number,
                detailsQuestion: AppString.kAskingTax.tr,
              ),
              Container(
                decoration: BoxDecoration(
                  color:  AppColor.kColorButton,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: TextButton(
                  onPressed: () {
                    controller.insertData();
                  },
                  child: const Text(
                    AppStringEn.kEntryButton,
                    style:AppTextStyles.textStyle30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
