import 'package:hive_flutter/hive_flutter.dart';

part 'project_status_model.g.dart';


@HiveType(typeId: 2)
enum Status{
  @HiveField(0)
  done, 
  @HiveField(1)
  inProgracess,
  @HiveField(2)
  end, 
  @HiveField(3)
  expired
}