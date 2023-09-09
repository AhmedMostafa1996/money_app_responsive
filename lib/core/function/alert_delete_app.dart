import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_app/controller/home_controller.dart';
import 'package:ui_app/core/constants/app_string.dart';

Future<bool> alertDeleteApp(){
  HomeControllerImpl controllerImpl = Get.find();
  Get.defaultDialog(
    title:AppString.kAlarm.tr ,
    middleText: AppString.kDelete.tr,
     actions: [
       ElevatedButton(
         onPressed: (){
           controllerImpl.deleteAllDatabase();
           Get.back();
         },
         child: Text(AppString.kConfirm.tr),
       ),
       ElevatedButton(
         child: Text(AppString.kCancel.tr),
         onPressed: (){
           Get.back();
         },
       ),
     ]
  );
  return Future.value(true);
}