import 'package:hive_flutter/hive_flutter.dart';

part 'project_status_model.g.dart';

@HiveType(typeId: 2)
class StatusModel {
  @HiveField(0)
  String? done;
  @HiveField(1)
  String? inProgracess;
  @HiveField(2)
  String? end;
  @HiveField(3)
  String? expired;

  StatusModel({this.done, this.end, this.expired, this.inProgracess});

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
        done: json['done'],
        inProgracess: json['inProgracess'],
        end: json['end'],
        expired: json['expired'],
      );
  Map<String, dynamic> toJson() => {
        'done': done,
        'inProgracess': inProgracess,
        'end': end,
        'expired': expired,
      };
}
