import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ui_app/money_elhrameen_app/domain/cubit/cubit.dart';
import 'package:ui_app/money_elhrameen_app/domain/cubit/state.dart';
import 'package:ui_app/money_elhrameen_app/shared/utils/app_string.dart';
import '../../../../domain/model/models.dart';
import '../../../../shared/utils/app_icon.dart';
import '../../../../shared/widget/money_entry_screen.dart';

class PayScreen extends StatelessWidget {
  PayScreen({
    super.key,
  });

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        return MoneyEntryScreen(
            namePage: AppString.kPayEntry,
            askingForMoneyQuestion: AppString.kPayMoney,
            moneyDetailsQuestion: AppString.kDetailsMoneyPay,
            nameController: _nameController,
            priceController: _priceController,
            onPressed: () {
              _entryMoney(
                context,
                _nameController,
                _priceController,
              );
            },
            detailsController: _nameController,
            details: false,
            );
      },
      listener: (context, state) => {
        if(state is InsertAllDatabaseState){
          Future.delayed(
            const Duration(seconds: 5),() {
            _priceController.dispose();
            _nameController.dispose();
          },),
           }
      },
    );
  }
}

void  _entryMoney(context, nameController, priceController) {
  AppCubit cubit = AppCubit.get(context);
  cubit.insertAllDatabase(
    WalletModel(
      nameDetails: nameController.text,
      money: double.tryParse(priceController.text)!*-1,
      date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
      total: cubit.getTotal(priceController,-1),
      icon: AppIcon.kIcPayItem,
      details: 'مصروفات',
    ),
    context
  );

}
