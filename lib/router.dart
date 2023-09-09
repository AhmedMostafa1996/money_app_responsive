import 'package:get/get.dart';
import 'package:ui_app/core/constants/routes.dart';
import 'package:ui_app/view/details_money/details_money.dart';
import 'package:ui_app/view/lang_screen/view/language_screen.dart';
import 'package:ui_app/view/setting_screen/view/setting_screen.dart';
import 'package:ui_app/view/splash_views/view/splash_screen.dart';
import 'view/home_views/view/home_screen.dart';
import 'view/it_top_screen/view/it_top_screen.dart';
import 'view/pay_screen/view/pay_screen.dart';
import 'view/transfers_view/view/transfers_screen.dart';

class AppRouter{
  static  List<GetPage> router=<GetPage>[
    GetPage(
      name: AppRoutes.setting,
      page: () =>const SettingScreen(),
    ),
    GetPage(
      name: AppRoutes.lang,
      page: () =>const LanguageScreen(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () =>const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () =>const HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.pay,
      page: () =>  const PayScreen(),
    ),
    GetPage(
      name: AppRoutes.itTop,
      page: () =>  const ItTopScreen(),
    ),
    GetPage(
      name: AppRoutes.transfer,
      page: () =>  TransfersScreen(),
    ),
    GetPage(
      name: AppRoutes.detailsMoney,
      page: () =>  const DetailsMoney(),
    ),
  ];
}