import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_todo_app/models/project_model.dart';
import 'package:hive_todo_app/models/services/hive_services.dart';

class HomeController extends GetxController {
  late HiveServices _dataBaseService;
  List<Project> allProjects = [];
  createProject({required Project project}) async {
    await _dataBaseService.createProject(project: project).then((value) {
      log(value.toString());
    });
  }

  loadAllProjectsFromDb() async {
    await _dataBaseService.loadAllProject().then((value) {
      if (value['resualt'] == CrudStatus.succes) {
        allProjects = value['data'];
        update();
      }
      if (value['resualt'] == CrudStatus.fail) {
        Get.defaultDialog(title: 'Error!', content: Text(value['data']));
      }
    });

  }

  @override
  void onInit() {
    _dataBaseService = HiveServices.instance;
    // loadAllProjectsFromDb();
    super.onInit();
  }
}
