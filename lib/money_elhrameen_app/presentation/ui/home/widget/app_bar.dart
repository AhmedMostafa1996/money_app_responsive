import 'package:flutter/material.dart';
import 'package:ui_app/money_elhrameen_app/domain/cubit/cubit.dart';
import 'package:ui_app/money_elhrameen_app/shared/utils/app_colors.dart';
import 'package:ui_app/money_elhrameen_app/shared/utils/app_string.dart';


AppBar buildAppBar(context){
  return AppBar(
    backgroundColor:AppColor.kColorAppbar,
    title: const Text(
      AppString.kAppBar,
    ),
    centerTitle: true,
    elevation: 0.0,
    actions: [
      IconButton(
        onPressed: () {
          _deleteDatabase(context);
        },
        icon: const Icon(Icons.delete_outline),
      ),
    ],
  );
}

void _deleteDatabase(context){
  var cubit=AppCubit.get(context);
  cubit.deleteAllDatabase();
}