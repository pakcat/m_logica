import 'package:get/get.dart';
import 'package:m_logica/app/modules/detail_truck/detail_truck_screen.dart';
import 'package:m_logica/app/modules/event/event_screen.dart';
import 'package:m_logica/app/modules/history/history_screen.dart';
import 'package:m_logica/app/modules/login/login_screen.dart';
import 'package:m_logica/app/modules/main/main_page.dart';
import 'package:m_logica/app/modules/onboarding/onboarding_screen.dart';
import 'package:m_logica/app/modules/splash/splash_screen.dart';
import 'package:m_logica/app/modules/truck/truck_screen.dart';
import 'package:m_logica/app/routes/app_routes.dart';

class AppPages {
  static List<GetPage> generateRoute() {
    return [
      GetPage(
        name: AppRoutes.splash,
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: AppRoutes.onBoarding,
        page: () => const OnBoardingScreen(),
      ),
      GetPage(
        name: AppRoutes.login,
        page: () => const LoginScreen(),
      ),
      GetPage(
        name: AppRoutes.main,
        page: () => const MainPage(),
      ),
      GetPage(
        name: AppRoutes.truck,
        page: () => const TruckScreen(),
      ),
      GetPage(
        name: AppRoutes.event,
        page: () => const EventScreen(),
      ),
      GetPage(
        name: AppRoutes.history,
        page: () => const HistoryScreen(),
      ),
      GetPage(
        name: AppRoutes.detailTruck,
        page: () => const DetailTruckScreen(),
      ),
    ];
  }
}
