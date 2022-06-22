

import 'package:get/get.dart';
import 'package:hive_todo_app/routes/app_routes.dart';
import 'package:hive_todo_app/views/home_screen.dart';

class AppPages{
  static List<GetPage>pages=[
    GetPage(name: AppRoutes.homeScreenRoute, page:()=> HomeScreen())

  ];
}