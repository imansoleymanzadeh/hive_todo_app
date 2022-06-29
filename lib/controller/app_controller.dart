import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_todo_app/models/project_model.dart';
import 'package:hive_todo_app/models/services/hive_services.dart';

class AppController extends GetxController {
  final HiveServices _dataBaseService = HiveServices();
  List<Project> allProjects = [];
  String? errorMessage;

  createProject({required Project project}) async {
    await _dataBaseService.createProject(project: project).then((value) {
      if (value['resualt'] == CrudStatus.succes) {
        allProjects.add(value['data']);
        update();
      }
      if (value['resualt'] == CrudStatus.fail) {
        errorMessage = value['data'];
        update();
      }
    });
  }

  Future<DateTime> pickDateTimeForTodo() async {
    var dateTimePicked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (dateTimePicked != null) {
      return dateTimePicked;
    } else {
      return DateTime.now();
    }
  }

  loadAllProjectsFromDb() async {
    log('geting data from DB');
    await _dataBaseService.loadAllProject().then((value) {
      if (value['resualt'] == CrudStatus.succes) {
        allProjects = value['data'];
        update();
      }
      if (value['resualt'] == CrudStatus.fail) {
        errorMessage = value['data'];
        update();
        Get.defaultDialog(title: 'Error!', content: Text(value['data']));
      }
    });
  }

  Future initDB() async {
    await _dataBaseService.initHiveDB().then((value) {
      if (value) {
        log('database is ready');
        loadAllProjectsFromDb();
      }
    });
  }

  @override
  void onInit() {
    initDB();

    super.onInit();
  }
}
