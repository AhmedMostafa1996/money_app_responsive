import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ui_app/money_elhrameen_app/domain/cubit/cubit.dart';
import 'package:ui_app/money_elhrameen_app/shared/utils/app_colors.dart';
import 'package:ui_app/money_elhrameen_app/shared/utils/app_text_styles.dart';
import '../../../../domain/cubit/state.dart';
import '../../../../domain/model/models.dart';
import '../../../../shared/utils/app_icon.dart';
import '../../../../shared/utils/app_string.dart';
import '../../../../shared/widget/default_text_filed.dart';

class TransfersScreen extends StatelessWidget {
  TransfersScreen({super.key});

  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        var size=MediaQuery.of(context).size;
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppString.kAppBar),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: AppColor.kColorAppbar,
          ),
          body: Container(
            height: size.height,
            decoration:const BoxDecoration(
          gradient:AppColor.kColorApp,
        ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AppString.kTransferEntry,
                    style:AppTextStyles.textStyle25
                  ),
                  DefaultTextFiled(
                    validator: (String value){
                      if(value.isEmpty){
                        return AppString.kErrorTextFiled;
                      }
                      return null;
                    },
                    controller: controller,
                    keyboard: TextInputType.number,
                    detailsQuestion: AppString.kTransferMoney,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color:  AppColor.kColorButton,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: TextButton(
                      onPressed: () {
                        AppCubit cubit = AppCubit.get(context);
                        cubit.insertAllDatabase(
                          WalletModel(
                            nameDetails: AppString.kTransfer,
                            money: double.tryParse(controller.text)!*-1,
                            date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                            total: cubit.getTotal(controller,-1),
                            icon: AppIcon.kIcTransfer,
                            details: AppString.kTransfer,
                          ),
                          context
                        );

                      },
                      child: const Text(
                        AppString.kEntryButton,
                        style:AppTextStyles.textStyle30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) => {
        if(state is InsertAllDatabaseState){
        Future.delayed(
        const Duration(seconds: 5),() {
             controller.dispose();
        },),
        }
      },
    );
  }
}
