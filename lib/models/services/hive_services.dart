// ignore_for_file: unused_catch_clause, empty_catches

import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_todo_app/models/proeject_task_modle.dart';
import 'package:hive_todo_app/models/project_model.dart';
import 'package:hive_todo_app/models/project_status_model.dart';

enum CrudStatus { succes, fail }

class HiveServices {
  HiveServices();
  static const String _boxName = 'ProjectsBox';

  Box<Project>? _projectBox;

  Future _initAdaptors<bool>() async {
    log('*********REGESTRING ADAPTORS*********', name: 'HIVE HELPER');
    try {
      Hive.registerAdapter(ProjectAdapter());
      Hive.registerAdapter(ProjectTaskAdapter());
      Hive.registerAdapter(StatusAdapter());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _initProjectBox() async {
    log('*********INITING THE HIVE BOX*********', name: 'HIVE HELPER');
    bool isExistBox = await Hive.boxExists(_boxName);
    bool isOpenedBox = Hive.isBoxOpen(_boxName);
    try {
      if (isOpenedBox) {
        _projectBox = Hive.box(_boxName);
        return true;
      } else {
        _projectBox = await Hive.openBox(_boxName);
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, dynamic>> createProject({required Project project}) async {
    Project? createdProject;
    try {
      log('*********CREATING PROJECT IN DB*********', name: 'HIVE HELPER');
      int addedProjectkeyNumber = await _projectBox!.add(project);
      createdProject = _projectBox!.getAt(addedProjectkeyNumber);
      return {'resualt': CrudStatus.succes, 'data': createdProject};
    } on HiveError catch (e) {
      log('********ERROR : ${e.message}*****', name: 'HIVE HELPER');
      return {'resualt': CrudStatus.fail, 'data': e.message};
    } catch (e) {
      return {'resualt': CrudStatus.fail, 'data': e.toString()};
    }
  }

  Future initHiveDB() async {
    try {
      var adapter = await _initAdaptors();
      var projectBox = await _initProjectBox();
      if (adapter && projectBox) {
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future editUpdateProject() async {
    // TODO Implemnt update prject
  }
  Future<Map<String, dynamic>> deleteSingleProject(
      {required int projectIndex}) async {
    try {
      _projectBox!.deleteAt(projectIndex);
      return {'resualt': CrudStatus.succes, 'data': true};
    } on HiveError catch (e) {
      return {'resualt': CrudStatus.fail, 'data': e.message};
    } catch (e) {
      return {'resualt': CrudStatus.fail, 'data': e.toString()};
    }
  }

  Future<Map<String, dynamic>> clearDb() async {
    try {
      _projectBox!.deleteAll(_projectBox!.keys);
      return {'resualt': CrudStatus.succes, 'data': true};
    } on HiveError catch (e) {
      return {'resualt': CrudStatus.fail, 'data': e.message};
    } catch (e) {
      return {'resualt': CrudStatus.fail, 'data': e.toString()};
    }
  }

  Future<Map<String, dynamic>> loadAllProject() async {
    try {
      log('******** GETING ALL PROJECT FROM DB *****', name: 'HIVE HELPER');
      log(_projectBox!.keys.toString());
      List<Project> projectList = _projectBox!.values.toList();
      return {'resualt': CrudStatus.succes, 'data': projectList};
    } on HiveError catch (e) {
      log('********ERROR : ${e.message}*****', name: 'HIVE HELPER');
      return {'resualt': CrudStatus.fail, 'data': e.message};
    } catch (e) {
      throw e;
      // return {
      //   'resualt': CrudStatus.fail,
      //   'data': e.toString(),
      // };
    }
  }

  Future<Map<String, dynamic>> loadSingleProject(
      {required int projectIndex}) async {
    try {
      Project retrivedProject = _projectBox!.getAt(projectIndex)!;
      return {'resualt': CrudStatus.succes, 'data': retrivedProject};
    } on HiveError catch (e) {
      return {'resualt': CrudStatus.fail, 'data': e.message};
    } catch (e) {
      return {'resualt': CrudStatus.fail, 'data': e.toString()};
    }
  }
}



// TODO EDIT SINGLE TASK IN PROJECT 
// TODO DELTE SINGLE TASK IN PROJECT
// TODO EDIT PROJECT
