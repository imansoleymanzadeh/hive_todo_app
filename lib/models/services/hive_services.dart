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
        ? log('projectAdaptor was Initalized')
        : Hive.registerAdapter(ProjectAdapter());
    Hive.isAdapterRegistered(1)
        ? log('projectTask was Initalized')
        : Hive.registerAdapter(ProjectTaskAdapter());
    Hive.isAdapterRegistered(2)
        ? log('projectStatus was Initalized')
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
      log('*********CREATING PROJECT IN DB*********');
      await _projectBox!.add(project).then((value) async {
        log('key is : $value');
        createdProject = await _projectBox!.getAt(value);
        log('project name : ${createdProject!.name!}');
      });

      return {'resualt': CrudStatus.succes, 'data': createdProject};
    } on HiveError catch (e) {
      return {'resualt': CrudStatus.fail, 'data': e.message};
    } catch (e) {
      return {'resualt': CrudStatus.fail, 'data': e.toString()};
    }
  }

  Future editUpdateProject() async {
    // TODO Implemnt update prject
  }
  Future delteProject() async {
    // Todo implemnt the delter project
  }

  Future loadAllProject() async {
    // TODO implement the loadAll projects
  }

  Future loadSingleProject() async {
    //TODO implemnt the singl load project
  }
}
