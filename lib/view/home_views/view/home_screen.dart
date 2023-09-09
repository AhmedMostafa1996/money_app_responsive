import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_app/controller/home_controller.dart';
import '../widget/app_bar.dart';
import '../widget/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildAppBar(),
      body: const Body(),
    );
  }
}

