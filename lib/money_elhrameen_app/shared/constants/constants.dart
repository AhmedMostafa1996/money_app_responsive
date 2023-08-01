import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/cubit/cubit.dart';
import '../utils/app_colors.dart';
import '../utils/app_icon.dart';

Color getColor(Map tasks) {
  if (tasks['icon'] == AppIcon.kIcTransfer ||
      tasks['icon'] == AppIcon.kIcPayItem) {
    return AppColor.kColorRed;
  }
  else {
    return AppColor.kColorGreen;
  }
}

String getSign(Map tasks){
  if (tasks['icon'] == AppIcon.kIcTransfer ||
      tasks['icon'] == AppIcon.kIcPayItem) {
    return '${tasks['money']}';
  }else{
    return '+${tasks['money']}';
  }
}

double getTotal(context){
  AppCubit cubit = AppCubit.get(context);

  if(cubit.information.isEmpty)
  {
    return 0.0;
  }
  else{
    return cubit.information[cubit.information.length-1]['total'];
  }
}

String getDate(tasks,String dd){
  int yesterday;
  yesterday=int.tryParse(dd)!-1;
  if(tasks['date']==DateFormat('yyyy-MM-$dd').format(DateTime.now())){
    return'اليوم';
  }else if(tasks['date']==DateFormat('yyyy-MM-$yesterday').format(DateTime.now())) {
    return 'امس';
  }else {
    return tasks['date'];
  }
}

double getMoneyN(controller) {
  return double.tryParse(controller.text)!*-1;
}

double getMoneyP(controller) {
  return double.tryParse(controller.text)!;
}

