import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_logica/app/modules/home/home_page.dart';
import 'package:m_logica/app/modules/profile/profile_page.dart';

class MainController extends GetxController {
  int indexPage = 0;
  List<Widget> pages = [const HomePage(), const ProfilePage()];

  changePage(index) {
    indexPage = index;
    update();
  }
}
