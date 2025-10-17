class Student {
  final int id;
  final DateTime createdAt;
  final String name;
  final String? phone;
  final String parentId;
  final String location;
  final int? yearId;
  final StudentStatus? status;
  final int? classId;

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

enum StudentStatus { active, inactive, graduated }
