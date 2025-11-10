import 'package:my_school/src/features/student/domain/entities/student.dart';

class StudentModel extends Student {
  StudentModel({
    required super.id,
    required super.createdAt,
    required super.name,
    required super.phone,
    required super.parentId,
    required super.location,
    required super.yearId,
    required super.status,
    required super.classId,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      name: json['name'] as String,
      phone: json['phone'] as String?,
      parentId: json['parent_id'] as String,
      location: json['location'] as String,
      yearId: json['year_id'] as int?,
      status: json['status'] ?? '',

      classId: json['class_id'] as int?,
    );
  }
}
