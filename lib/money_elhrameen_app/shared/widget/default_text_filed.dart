import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_app/money_elhrameen_app/shared/utils/app_text_styles.dart';

class DefaultTextFiled extends StatelessWidget {
  const DefaultTextFiled({super.key, required this.controller, required this.detailsQuestion, required this.keyboard, required this.validator});

  final TextEditingController controller;
  final String detailsQuestion;
  final TextInputType keyboard;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: TextFormField(
          validator:(s){
            return validator(s);
          } ,
          keyboardType:keyboard ,
          textDirection:  TextDirection.rtl,
          textAlign: TextAlign.right,
          style: AppTextStyles.textStyle16,
          controller:controller ,
          decoration:  InputDecoration(
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  25.0,
                ),
              ),
            ) ,
            errorBorder:const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  25.0,
                ),
              ),
            ) ,
            errorStyle: AppTextStyles.textStyle20,
            hintText:detailsQuestion,
            hintTextDirection: TextDirection.rtl,
            hintStyle: const TextStyle(color: Colors.white),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  25.0,
                ),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  25.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
