import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ui_app/money_elhrameen_app/domain/cubit/cubit.dart';
import 'package:ui_app/money_elhrameen_app/shared/constants/constants.dart';
import 'package:ui_app/money_elhrameen_app/shared/utils/app_text_styles.dart';
import '../../presentation/router/routes.dart';

class DetailsMoneyItem extends StatelessWidget {
  const DetailsMoneyItem({super.key,
    required this.icon,
    required this.nameDetails,
    required this.money,
    required this.color,
    required this.id,
    required this.tasks,
    required this.date});

  final String icon;
  final String nameDetails;
  final double money;
  final String date;
  final Color color;
  final int id;
  final Map tasks;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(tasks['id'].toString()),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.detailsMoney, arguments: id);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 60,
          color: Colors.white,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SvgPicture.asset(
                icon,
                height: 40.0,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                nameDetails.length>8?'${nameDetails.substring(0,8)}..':nameDetails,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                date,
                style: AppTextStyles.textStyle18.copyWith(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width:45.0 ,
              ),
              Text(
                getSign(tasks),
                style: AppTextStyles.textStyle18.copyWith(
                    color: getColor(tasks)
                ),
              ),
            ]),
          ),
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteRowInDatabase(id,context);
      },

    );
  }

}
