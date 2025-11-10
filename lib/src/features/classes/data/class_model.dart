import 'package:my_school/src/features/classes/domain/class.dart';

class ClassModel extends Class {
  ClassModel({required super.id, required super.name, required super.yearId});

  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      id: json['id'] as int,
      name: json['name'] as String,
      yearId: json['year_id'] as int,
    );
  }
}
