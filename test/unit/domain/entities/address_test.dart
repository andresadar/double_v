import 'package:doublev/features/address/domain/entities/address.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Address Entity Tests', () {
    late Address testAddress;

    setUp(() {
      testAddress = const Address(
        id: '1',
        userId: 'user1',
        country: 'Colombia',
        department: 'Antioquia',
        municipality: 'Medellín',
        street: 'Carrera 10 # 20-30',
        additionalInfo: 'Apartamento 201',
      );
    });

    test('should return correct full address', () {
      // arrange & act
      final fullAddress = testAddress.fullAddress;

      // assert
      expect(fullAddress, 'Carrera 10 # 20-30, Apartamento 201, Medellín, Antioquia, Colombia');
    });

    test('should return correct full address without additional info', () {
      // arrange
      const address = Address(
        id: '1',
        userId: 'user1',
        country: 'Colombia',
        department: 'Antioquia',
        municipality: 'Medellín',
        street: 'Carrera 10 # 20-30',
      );

      // act
      final fullAddress = address.fullAddress;

      // assert
      expect(fullAddress, 'Carrera 10 # 20-30, Medellín, Antioquia, Colombia');
    });

    test('should support value equality', () {
      // arrange
      const address1 = Address(
        id: '1',
        userId: 'user1',
        country: 'Colombia',
        department: 'Antioquia',
        municipality: 'Medellín',
        street: 'Carrera 10 # 20-30',
        additionalInfo: 'Apartamento 201',
      );

      const address2 = Address(
        id: '1',
        userId: 'user1',
        country: 'Colombia',
        department: 'Antioquia',
        municipality: 'Medellín',
        street: 'Carrera 10 # 20-30',
        additionalInfo: 'Apartamento 201',
      );

      const address3 = Address(
        id: '2',
        userId: 'user1',
        country: 'Colombia',
        department: 'Antioquia',
        municipality: 'Medellín',
        street: 'Carrera 10 # 20-30',
        additionalInfo: 'Apartamento 201',
      );

      // assert
      expect(address1, equals(address2));
      expect(address1, isNot(equals(address3)));
    });

    test('copyWith should create new instance with updated values', () {
      // arrange & act
      final updatedAddress = testAddress.copyWith(
        street: 'Calle 50 # 10-20',
        additionalInfo: 'Casa 123',
      );

      // assert
      expect(updatedAddress.id, testAddress.id);
      expect(updatedAddress.userId, testAddress.userId);
      expect(updatedAddress.country, testAddress.country);
      expect(updatedAddress.department, testAddress.department);
      expect(updatedAddress.municipality, testAddress.municipality);
      expect(updatedAddress.street, 'Calle 50 # 10-20');
      expect(updatedAddress.additionalInfo, 'Casa 123');
    });

    test('copyWith should keep original values when no changes provided', () {
      // arrange & act
      final updatedAddress = testAddress.copyWith();

      // assert
      expect(updatedAddress, equals(testAddress));
    });
  });
}
