import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_app/money_elhrameen_app/domain/cubit/cubit.dart';
import 'package:ui_app/money_elhrameen_app/domain/cubit/state.dart';
import '../widget/app_bar.dart';
import '../widget/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar:buildAppBar(context),
          body: const Body(),
        );
      } ,
      listener: (context, state) => {},
    );
  }
}

