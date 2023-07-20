import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_logica/app/core/values/app_colors.dart';
import 'package:m_logica/app/routes/app_pages.dart';
import 'package:m_logica/app/routes/app_routes.dart';

class MLogicaApp extends StatelessWidget {
  const MLogicaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MLOGICA',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        primaryColor: AppColors.neutral90,
        fontFamily: "Roboto",
      ),
      defaultTransition: Transition.fade,
      getPages: AppPages.generateRoute(),
      initialRoute: AppRoutes.splash,
    );
  }
}
