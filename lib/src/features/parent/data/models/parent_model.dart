import 'package:my_school/src/features/parent/domain/entities/parent.dart';

class ParentModel extends Parent {
  ParentModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.createdAt,
  });

  factory ParentModel.fromJson(Map<String, dynamic> json) {
    return ParentModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
