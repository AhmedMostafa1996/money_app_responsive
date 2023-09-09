import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ui_app/controller/home_controller.dart';
import 'package:ui_app/core/constants/app_text_styles.dart';
import 'package:ui_app/core/constants/constants.dart';
import '../../../core/constants/routes.dart';

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
    HomeControllerImpl controller=Get.put(HomeControllerImpl());
    return Dismissible(
      key: Key(tasks['id'].toString()),
      onDismissed: (direction) {
        controller.deleteRowInDatabase(id,context);
      },
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.detailsMoney, arguments: id);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          height: 60,
          color: Colors.white,
          child: Row(
              children: [
                Text(
              getSign(tasks),
              style: AppTextStyles.textStyle18.copyWith(
                  color: getColor(tasks)
              ),
            ),
                const SizedBox(
                  width:45.0 ,
                ),
                Text(
                  date,
                  style: AppTextStyles.textStyle18.copyWith(
                    color: Colors.grey,
                  ),
                ),
                const Spacer(),
                Text(
                  nameDetails.length>8?'${nameDetails.substring(0,8)}..':nameDetails,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                SvgPicture.asset(
                  icon,
                  height: 40.0,
                ),
              ]),
        ),
      ),
    );
  }

}
