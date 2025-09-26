import 'package:hive/hive.dart';
import '../../domain/entities/address.dart';

part 'address_model.g.dart';

@HiveType(typeId: 1)
class AddressModel extends Address {
  const AddressModel({
    required super.id,
    required super.userId,
    required super.country,
    required super.department,
    required super.municipality,
    required super.street,
    super.additionalInfo,
  });

  /// Convierte una entidad Address a AddressModel
  factory AddressModel.fromEntity(Address address) {
    return AddressModel(
      id: address.id,
      userId: address.userId,
      country: address.country,
      department: address.department,
      municipality: address.municipality,
      street: address.street,
      additionalInfo: address.additionalInfo,
    );
  }

  /// Convierte el modelo a entidad Address
  Address toEntity() {
    return Address(
      id: id,
      userId: userId,
      country: country,
      department: department,
      municipality: municipality,
      street: street,
      additionalInfo: additionalInfo,
    );
  }

  /// Factory constructor para crear desde JSON
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      country: json['country'] as String,
      department: json['department'] as String,
      municipality: json['municipality'] as String,
      street: json['street'] as String,
      additionalInfo: json['additionalInfo'] as String?,
    );
  }

  /// Convierte el modelo a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'country': country,
      'department': department,
      'municipality': municipality,
      'street': street,
      'additionalInfo': additionalInfo,
    };
  }

  @override
  @HiveField(0)
  String get id => super.id;

  @override
  @HiveField(1)
  String get userId => super.userId;

  @override
  @HiveField(2)
  String get country => super.country;

  @override
  @HiveField(3)
  String get department => super.department;

  @override
  @HiveField(4)
  String get municipality => super.municipality;

  @override
  @HiveField(5)
  String get street => super.street;

  @override
  @HiveField(6)
  String? get additionalInfo => super.additionalInfo;
}
