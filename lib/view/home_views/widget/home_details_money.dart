import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_app/core/constants/app_string.dart';
import 'package:ui_app/core/constants/app_text_styles.dart';
import 'package:ui_app/core/constants/constants.dart';
import 'package:ui_app/core/shared/details_money_item.dart';

class HomeDetailsMoney extends StatelessWidget {
  const HomeDetailsMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            right: 20.0,
            left: 20.0,
          ),
          child: Text(
            AppString.kDealing.tr,
            style: AppTextStyles.textStyle20
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0, bottom: 10.0,left: 20.0,),
          child: Text(
            ListData.information[ListData.information.length - 1]['date'],
            style: AppTextStyles.textStyle15,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return detailsMoney(ListData.information.reversed.toList()[index]);
            },
            itemCount: ListData.information.length,
          ),
        ),
      ],
    );
  }
}

Widget detailsMoney(Map information) {
  return DetailsMoneyItem(
    icon: information['icon'],
    nameDetails: information['nameDetails'],
    money: information['money'],
    color: getColor(information),
    id: information['id'],
    tasks: information,
    date: getDate(information, DateTime.now().day.toString()),
  );
}
