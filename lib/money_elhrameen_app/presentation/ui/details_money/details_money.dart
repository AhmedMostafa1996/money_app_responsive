import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_app/money_elhrameen_app/shared/utils/app_colors.dart';
import 'package:ui_app/money_elhrameen_app/shared/utils/app_string.dart';
import 'package:ui_app/money_elhrameen_app/shared/utils/app_text_styles.dart';
import '../../../domain/cubit/cubit.dart';
import '../../../shared/constants/constants.dart';

class DetailsMoney extends StatelessWidget {
  const DetailsMoney({super.key});

  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context)!.settings.arguments as int;
    AppCubit cubit = AppCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.kAppBar),
        centerTitle: true,
        backgroundColor: AppColor.kColorAppbar,
      ),
      body: _detailsMoney(cubit.information[id - 1]),
    );
  }
}

Widget _detailsMoney(Map tasks) {
  return Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15.0),
            child: SvgPicture.asset(
              tasks['icon'],
              height: 60.0,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 15.0),
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
        height: 20.0,
      ),
      Text(
        AppString.kItTopName,
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
        height: 20.0,
      ),
      Text(
        AppString.kDetailsMoney,
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
        height: 20.0,
      ),
      Text(
        AppString.kDateMoney,
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
