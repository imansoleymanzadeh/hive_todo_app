import 'package:get/get.dart';
import 'package:hive_todo_app/controller/app_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AppController>(AppController());
  }
}
