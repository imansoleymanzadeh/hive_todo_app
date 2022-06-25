// ignore_for_file: unused_catch_clause, empty_catches

import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_todo_app/models/proeject_task_modle.dart';
import 'package:hive_todo_app/models/project_model.dart';
import 'package:hive_todo_app/models/project_status_model.dart';

enum CrudStatus { succes, fail }

class HiveServices {
  HiveServices._() {
    initAdaptors();
    initProjectBox();
  }
  static const String _boxName = 'ProjectsBox';

  static final HiveServices instance = HiveServices._();

  Box<Project>? _projectBox;

  initAdaptors() {
    log('*********REGESTRING ADAPTORS*********', name: 'HIVE HELPER');
    Hive.isAdapterRegistered(0)
        ? log('projectAdaptor was Initalized', name: 'HIVE HELPER')
        : Hive.registerAdapter(ProjectAdapter());
    Hive.isAdapterRegistered(1)
        ? log('projectTask was Initalized', name: 'HIVE HELPER')
        : Hive.registerAdapter(ProjectTaskAdapter());
    Hive.isAdapterRegistered(2)
        ? log('projectStatus was Initalized', name: 'HIVE HELPER')
        : Hive.registerAdapter(StatusAdapter());
  }

  Future initProjectBox() async {
    log('*********INITING THE HIVE BOX*********', name: 'HIVE HELPER');
    bool isExistBox = await Hive.boxExists(_boxName);
    bool isOpenedBox = Hive.isBoxOpen(_boxName);
    if (isOpenedBox) {
      _projectBox = Hive.box(_boxName);
      return _projectBox;
    } else {
      _projectBox = await Hive.openBox(_boxName);
      return _projectBox;
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
      // throw e;
      return {
        'resualt': CrudStatus.fail,
        'data': e.toString(),
      };
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
