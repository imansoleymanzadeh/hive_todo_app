import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_todo_app/routes/app_pages.dart';

import 'package:hive_todo_app/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      getPages: AppPages.pages,
    );
  }
}
