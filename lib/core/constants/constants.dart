
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqlite_api.dart';

import 'app_colors.dart';
import 'app_icon.dart';

class ListData {
 static List<Map> total = [];

 static List<Map> information = [];

 static late Database database;

}

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

 if(ListData.information.isEmpty)
 {
  return 0.0;
 }
 else{
  return ListData.information[ListData.information.length-1]['total'];
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

