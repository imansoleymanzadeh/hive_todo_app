import 'dart:developer';

import 'package:get/state_manager.dart';
import 'package:hive_todo_app/models/project_model.dart';
import 'package:hive_todo_app/models/services/hive_services.dart';

class HomeController extends GetxController {
  late HiveServices _dataBaseService;

  createProject({required Project project}) async {
    await _dataBaseService.createProject(project: project).then((value) {
      log(value.toString());
    });
  }

  @override
  void onInit() {
    _dataBaseService = HiveServices.instance;
    super.onInit();
  }
}
