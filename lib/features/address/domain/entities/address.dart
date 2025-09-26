import 'package:equatable/equatable.dart';

/// Entidad Address en la capa de dominio
/// Representa una dirección física completa
class Address extends Equatable {
  const Address({
    required this.id,
    required this.userId,
    required this.country,
    required this.department,
    required this.municipality,
    required this.street,
    this.additionalInfo,
  });

  final String id;
  final String userId; // ID del usuario propietario
  final String country;
  final String department;
  final String municipality;
  final String street;
  final String? additionalInfo;

  /// Getter para la dirección completa formateada
  String get fullAddress {
    final buffer = StringBuffer();
    buffer.write(street);
    
    if (additionalInfo != null && additionalInfo!.isNotEmpty) {
      buffer.write(', $additionalInfo');
    }
    
    buffer.write(', $municipality, $department, $country');
    return buffer.toString();
  }

  /// Crea una copia de la dirección con los campos modificados
  Address copyWith({
    String? id,
    String? userId,
    String? country,
    String? department,
    String? municipality,
    String? street,
    String? additionalInfo,
  }) {
    return Address(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      country: country ?? this.country,
      department: department ?? this.department,
      municipality: municipality ?? this.municipality,
      street: street ?? this.street,
      additionalInfo: additionalInfo ?? this.additionalInfo,
    );
  }

  @override
  List<Object?> get props => [
    id,
    userId,
    country,
    department,
    municipality,
    street,
    additionalInfo,
  ];
}
