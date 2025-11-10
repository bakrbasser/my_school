import 'package:my_school/src/core/presentation/year_to_arabic.dart';

class Student {
  final int id;
  final DateTime createdAt;
  final String name;
  final String? phone;
  final String parentId;
  final String location;
  final int? yearId;
  final String? status;
  final int? classId;

  String get yearInArabic => yearToArabic(yearId);

  Student({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.phone,
    required this.parentId,
    required this.location,
    required this.yearId,
    required this.status,
    required this.classId,
  });
}
