import 'package:hive/hive.dart';
import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends User {
  const UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.birthDate,
    super.addresses,
  });

  /// Convierte una entidad User a UserModel
  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      firstName: user.firstName,
      lastName: user.lastName,
      birthDate: user.birthDate,
      addresses: user.addresses,
    );
  }

  /// Convierte el modelo a entidad User
  User toEntity() {
    return User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      birthDate: birthDate,
      addresses: addresses,
    );
  }

  /// Factory constructor para crear desde JSON (si es necesario)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ?? [],
    );
  }

  /// Convierte el modelo a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'birthDate': birthDate.toIso8601String(),
      'addresses': addresses,
    };
  }

  @override
  @HiveField(0)
  String get id => super.id;

  @override
  @HiveField(1)
  String get firstName => super.firstName;

  @override
  @HiveField(2)
  String get lastName => super.lastName;

  @override
  @HiveField(3)
  DateTime get birthDate => super.birthDate;

  @override
  @HiveField(4)
  List<String> get addresses => super.addresses;
}
