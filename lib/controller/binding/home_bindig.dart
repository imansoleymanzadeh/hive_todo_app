import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:hive_todo_app/controller/home_screen_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}
