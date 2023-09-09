import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_app/core/constants/app_size.dart';
import 'package:ui_app/core/constants/app_string.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: size.height/4,
        ),
        const Icon(
          Icons.error_outline,
          size: AppSize.s50,
        ),
         Text(
          AppString.kErrorHome.tr,
          style: const TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
