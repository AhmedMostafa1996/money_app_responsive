import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ui_app/money_elhrameen_app/domain/cubit/cubit.dart';
import 'package:ui_app/money_elhrameen_app/domain/cubit/state.dart';
import 'package:ui_app/money_elhrameen_app/presentation/router/routes.dart';
import 'package:ui_app/money_elhrameen_app/presentation/ui/home/widget/home_details_money.dart';
import 'package:ui_app/money_elhrameen_app/shared/utils/app_colors.dart';
import 'package:ui_app/money_elhrameen_app/shared/utils/app_string.dart';
import 'package:ui_app/money_elhrameen_app/shared/utils/app_text_styles.dart';
import 'package:ui_app/money_elhrameen_app/shared/widget/default_icon_button.dart';
import '../../../../shared/utils/app_icon.dart';
import '../../error_screen/error_screen.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=AppCubit.get(context);
    //طول وعرض الشاشه
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AppCubit,AppState>(
      builder: (context, state) =>Column(
        children: [
          SizedBox(
            height: _sizeHeight(size.width,size.height),
            child: Stack(
                children: [
                  Container(
                    //هتاخد 30% من طول الاسكرينه
                    height:_sizeHeight(size.width,size.height) - 27,
                    padding: EdgeInsets.only(bottom: (size.height*0.3)/3),
                    decoration: const BoxDecoration(
                      gradient: AppColor.kColorApp,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(36.0),
                          bottomLeft: Radius.circular(36.0),
                        )),
                    child:SizedBox(
                      width: double.infinity,
                      child:cubit.total.isEmpty?_moneyZero(context): _moneyNow(context,cubit.total[0]),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(
                                0,
                                10,
                              ),
                              blurRadius: 50.0,
                            ),
                          ]),
                      child: _cardWidget(),
                    ),
                  ),
                ]),
          ),
          cubit.information.isEmpty? const ErrorScreen():const Expanded(child: HomeDetailsMoney()),
        ],
      ) ,
      listener: (context, state) => {},
    );

  }
}

Widget _cardWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      DefaultIconButton(
        nameIcon: AppString.kItTop,
        onTap: () {
          Get.toNamed(AppRoutes.itTop);
        },
        icon: AppIcon.kIcTopUp,
      ),
      DefaultIconButton(
        nameIcon: AppString.kTransfer,
        onTap: () {
          Get.toNamed(AppRoutes.transfer);
        },
        icon: AppIcon.kIcTransfer,
      ),
      DefaultIconButton(
        nameIcon: AppString.kPay,
        onTap: () {
          Get.toNamed(AppRoutes.pay);
        },
        icon: AppIcon.kIcPay,
      ),
    ],
  );
}

Widget _moneyNow(context,Map totalAmount){
  return  Center(
    child: Text.rich(
      TextSpan(
          style:  AppTextStyles.textStyle20,
          text: AppString.kMoney,
          children: [
            TextSpan(
                style: AppTextStyles.textStyle60 ,
                text:totalAmount['total'].toString(),
            ),
          ]
      ),
    ),
  );
}


Widget _moneyZero(context){
  return  const Center(
    child: Text.rich(
      TextSpan(
          style: AppTextStyles.textStyle25,
          text: AppString.kMoney,
          children: [
            TextSpan(
                style: AppTextStyles.textStyle60,
                text:AppString.kZeroMoney,
            ),
          ]
      ),
    ),
  );
}

double _sizeHeight(width,height){
  if(width>height) {
    return height * 0.5;
  }else{
    return height*0.3;
  }
}


