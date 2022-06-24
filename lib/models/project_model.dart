import 'package:hive_todo_app/models/proeject_task_modle.dart';
import 'package:hive_todo_app/models/project_status_model.dart';
import 'package:hive/hive.dart';

part 'project_model.g.dart';

@HiveType(typeId: 0)
class Project extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? description;
  @HiveField(2)
  DateTime? projectCreateDateTime;
  @HiveField(3)
  List<ProjectTask>? taskList;
  @HiveField(4)
  StatusModel? projectStatus;
  @HiveField(5)
  DateTime? projectEndDateTime;

  Project({
    this.name,
    this.description,
    this.projectCreateDateTime,
    this.projectEndDateTime,
    this.projectStatus,
    this.taskList,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
      name: json['name'],
      description: json['description'],
      projectCreateDateTime: json['projectCreateDateTime'],
      projectEndDateTime: json['projectEndDateTime'],
      projectStatus: json['projectStatus'],
      taskList: json['taskLists']);

  Map<String, dynamic> toJson() => {
    'name':name,
    'description':description, 
    'projectCreateDateTime': projectCreateDateTime,
    'projectEndDateTime':projectEndDateTime, 
    'projectStatus':projectStatus,
    'taskList': taskList
  };
}
