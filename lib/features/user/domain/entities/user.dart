import 'package:equatable/equatable.dart';

/// Entidad User en la capa de dominio
/// Representa un usuario con sus datos básicos
class User extends Equatable {
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    this.addresses = const [],
  });

  final String id;
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final List<String> addresses; // IDs de las direcciones asociadas

  /// Getter para el nombre completo
  String get fullName => '$firstName $lastName';

  /// Getter para la edad calculada
  int get age {
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month || 
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  /// Crea una copia del usuario con los campos modificados
  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    DateTime? birthDate,
    List<String>? addresses,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthDate: birthDate ?? this.birthDate,
      addresses: addresses ?? this.addresses,
    );
  }

  @override
  List<Object> get props => [id, firstName, lastName, birthDate, addresses];
}
