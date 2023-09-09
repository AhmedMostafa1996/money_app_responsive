import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ui_app/core/constants/app_colors.dart';
import 'package:ui_app/core/constants/app_size.dart';
import 'package:ui_app/core/constants/app_string.dart';
import 'package:ui_app/core/constants/app_text_styles.dart';
import 'package:ui_app/core/constants/constants.dart';

class DetailsMoney extends StatelessWidget {
  const DetailsMoney({super.key});

  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStringEn.kMoneyApp),
        centerTitle: true,
        backgroundColor: AppColor.kColorAppbar,
      ),
      body: _detailsMoney(ListData.information[id - 1]),
    );
  }
}

Widget _detailsMoney(Map tasks) {
  return Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: AppPadding.p15, left: AppPadding.p15,right: AppPadding.p15),
            child: SvgPicture.asset(
              tasks['icon'],
              height: AppSize.s60,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: AppPadding.p15, right: AppPadding.p15),
            child: Text(
              getSign(tasks),
              style:AppTextStyles.textStyle20.copyWith(
              color: getColor(tasks),
            ),
          ),
          )
        ],
      ),
      const SizedBox(
        height: AppSize.s20,
      ),
      Text(
        AppString.kNameTookMoney.tr,
        style: AppTextStyles.textStyle25.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        '${tasks['nameDetails']}',
        style: AppTextStyles.textStyle20.copyWith(
          color: AppColor.kColorAppbar,
        ),
      ),
      const SizedBox(
        height: AppSize.s20,
      ),
      Text(
        AppString.kDetails.tr,
        style: AppTextStyles.textStyle25.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        '${tasks['details']}',
        style: AppTextStyles.textStyle20.copyWith(
          color: AppColor.kColorAppbar,
        ),
      ),
      const SizedBox(
        height: AppSize.s20,
      ),
      Text(
        AppString.kDate.tr,
        style: AppTextStyles.textStyle25.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text(
        "${tasks['date']}",
        style: AppTextStyles.textStyle20.copyWith(
          color: AppColor.kColorAppbar,
        ),
      ),
    ],
  );
}
