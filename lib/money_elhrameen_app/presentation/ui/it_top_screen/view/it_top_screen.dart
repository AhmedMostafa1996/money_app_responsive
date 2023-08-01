import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ui_app/money_elhrameen_app/domain/cubit/cubit.dart';
import 'package:ui_app/money_elhrameen_app/domain/cubit/state.dart';
import 'package:ui_app/money_elhrameen_app/domain/model/models.dart';
import 'package:ui_app/money_elhrameen_app/shared/utils/app_string.dart';
import '../../../../shared/utils/app_icon.dart';
import '../../../../shared/widget/money_entry_screen.dart';

class ItTopScreen extends StatelessWidget {
  ItTopScreen({
    super.key,
  });

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        return MoneyEntryScreen(
          namePage: AppString.kItTopEntry,
          askingForMoneyQuestion: AppString.kItTopMoney,
          moneyDetailsQuestion: AppString.kItTopName,
          nameController: _nameController,
          priceController: _priceController,
          detailsController: _detailsController,
          onPressed: () {
            _entryMoney(
              context,
              _priceController,
              _nameController,
              _detailsController,
            );
          },
          details: true,
        );
      },
      listener: (context, state) => {
        if(state is InsertAllDatabaseState){
          Future.delayed(
            const Duration(seconds: 5),() {
            _nameController.dispose();
            _detailsController.dispose();
            _priceController.dispose();
          },),
        }
      },
    );
  }
}

void _entryMoney(context, priceController, nameController, detailsController) {
  AppCubit cubit = AppCubit.get(context);
  cubit.insertAllDatabase(
    WalletModel(
      nameDetails: nameController.text,
      money: double.tryParse(priceController.text)!,
      date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      total: cubit.getTotal(priceController,1),
      icon: AppIcon.kIcTopUpItem,
      details: detailsController.text,
    ),
     context
  );
}
