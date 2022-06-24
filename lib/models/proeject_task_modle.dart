import 'package:hive_flutter/adapters.dart';
import 'package:hive_todo_app/models/project_status_model.dart';
part 'proeject_task_modle.g.dart';

@HiveType(typeId: 1)
class ProjectTask {
  @HiveField(0)
  String? taskName;
  @HiveField(1)
  String? taskDescription;
  @HiveField(2)
  DateTime? taskStartDateTime;
  @HiveField(3)
  DateTime? taskEndDateTime;
  @HiveField(4)
  StatusModel? taskMode;
}
