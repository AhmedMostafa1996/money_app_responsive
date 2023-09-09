import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_app/controller/home_controller.dart';
import 'package:ui_app/core/constants/app_icon.dart';
import 'package:ui_app/core/constants/app_string.dart';
import 'package:ui_app/core/constants/app_text_styles.dart';
import 'package:ui_app/core/constants/constants.dart';
import 'package:ui_app/core/constants/routes.dart';
import 'package:ui_app/core/constants/app_colors.dart';
import 'package:ui_app/core/function/alert_delete_app.dart';
import 'package:ui_app/view/error_screen/error_screen.dart';
import 'package:ui_app/view/home_views/widget/default_icon_button.dart';
import 'home_details_money.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: alertDeleteApp,
      child: GetBuilder<HomeControllerImpl>(
        builder: (controller) => Column(
          children: [
            SizedBox(
              height: _sizeHeight(size.width, size.height),
              child: Stack(children: [
                Container(
                  //هتاخد 30% من طول الاسكرينه
                  height: _sizeHeight(size.width, size.height) - 27,
                  padding: EdgeInsets.only(bottom: (size.height * 0.3) / 3),
                  decoration: const BoxDecoration(
                    gradient: AppColor.kColorApp,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(36.0),
                      bottomLeft: Radius.circular(36.0),
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: _moneyNow(),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(
                              0,
                              10,
                            ),
                            blurRadius: 50.0,
                          ),
                        ]),
                    child: _cardWidget(),
                  ),
                ),
              ]),
            ),
            ListData.information.isEmpty
                ? const ErrorScreen()
                : const Expanded(child: HomeDetailsMoney()),
          ],
        ),
      ),
    );
  }
}

Widget _cardWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      DefaultIconButton(
        nameIcon: AppString.kHomeTookMoney.tr,
        onTap: () {
          Get.toNamed(AppRoutes.itTop);
        },
        icon: AppIcon.kIcTopUp,
      ),
      DefaultIconButton(
        nameIcon: AppString.kTax.tr,
        onTap: () {
          Get.toNamed(AppRoutes.transfer);
        },
        icon: AppIcon.kIcTransfer,
      ),
      DefaultIconButton(
        nameIcon: AppString.kPay.tr,
        onTap: () {
          Get.toNamed(AppRoutes.pay);
        },
        icon: AppIcon.kIcPay,
      ),
    ],
  );
}

Widget _moneyNow() {
  return GetBuilder<HomeControllerImpl>(
    builder: (controller) => Center(
      child: Text.rich(
        TextSpan(
            style: AppTextStyles.textStyle20,
            text: AppString.kMoney,
            children: [
              TextSpan(
                style: AppTextStyles.textStyle60,
                text: controller.moneyNow(),
              ),
            ]),
      ),
    ),
  );
}

double _sizeHeight(width, height) {
  if (width > height) {
    return height * 0.5;
  } else {
    return height * 0.3;
  }
}
