import 'package:flutter/material.dart';
import 'package:ui_app/money_elhrameen_app/domain/cubit/cubit.dart';
import 'package:ui_app/money_elhrameen_app/shared/utils/app_string.dart';
import 'package:ui_app/money_elhrameen_app/shared/utils/app_text_styles.dart';
import '../../../../shared/constants/constants.dart';
import '../../../../shared/widget/details_money_item.dart';

class HomeDetailsMoney extends StatelessWidget {
  const HomeDetailsMoney({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=AppCubit.get(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
         Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            right: 20.0,
          ),
          child: Text(
            AppString.kLastDealings,
            style: AppTextStyles.textStyle20.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
        ),
         Padding(
          padding: const EdgeInsets.only(right: 20.0, bottom: 10.0),
          child: Text(
            cubit.information[cubit.information.length-1]['date'],
            style: AppTextStyles.textStyle15,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>detailsMoney(cubit.information[index],context),
            itemCount: cubit.information.length,
          ),
        ),
      ],
    );
  }
  }

  Widget detailsMoney(Map information,context){
    return  DetailsMoneyItem(
      icon: information['icon'],
      nameDetails: information['nameDetails'],
      money: information['money'],
      color: getColor(information),
      id: information['id'],
      tasks: information,
      date:getDate(information,DateTime.now().day.toString()),
    );

  }



