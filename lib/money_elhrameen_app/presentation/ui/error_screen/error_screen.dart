import 'package:flutter/material.dart';

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
          size: 50.0,
        ),
        const Text(
          'لا يوجد بيانات لعرضها',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
