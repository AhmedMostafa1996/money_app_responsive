import 'package:get/get.dart';
import 'package:ui_app/money_elhrameen_app/presentation/router/routes.dart';
import 'package:ui_app/money_elhrameen_app/presentation/ui/details_money/details_money.dart';
import 'package:ui_app/money_elhrameen_app/presentation/ui/it_top_screen/view/it_top_screen.dart';
import 'package:ui_app/money_elhrameen_app/presentation/ui/pay_screen/view/pay_screen.dart';
import 'package:ui_app/money_elhrameen_app/presentation/ui/transfers_view/view/transfers_screen.dart';
import '../ui/home/view/home_screen.dart';
import '../ui/splash_views/view/splash_screen.dart';

class AppRouter{
  static  List<GetPage> router=<GetPage>[
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
      page: () =>  PayScreen(),
    ),
    GetPage(
      name: AppRoutes.itTop,
      page: () =>  ItTopScreen(),
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