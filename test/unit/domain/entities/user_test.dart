import 'package:doublev/features/user/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User Entity Tests', () {
    late User testUser;

    setUp(() {
      testUser = User(
        id: '1',
        firstName: 'John',
        lastName: 'Doe',
        birthDate: DateTime(1990, 5, 15),
        addresses: const ['address1', 'address2'],
      );
    });

    test('should return correct full name', () {
      // arrange & act
      final fullName = testUser.fullName;

      // assert
      expect(fullName, 'John Doe');
    });

    test('should calculate age correctly', () {
      // arrange
      final birthDate = DateTime(1990, 5, 15);
      final user = User(
        id: '1',
        firstName: 'John',
        lastName: 'Doe',
        birthDate: birthDate,
      );

      // act
      final age = user.age;

      // assert
      final currentYear = DateTime.now().year;
      final expectedAge = currentYear - 1990;
      
      expect(age, anyOf([expectedAge - 1, expectedAge])); // Can vary by a year depending on current date
    });

    test('should support value equality', () {
      // arrange
      final user1 = User(
        id: '1',
        firstName: 'John',
        lastName: 'Doe',
        birthDate: DateTime(1990, 5, 15),
        addresses: const ['address1'],
      );

      final user2 = User(
        id: '1',
        firstName: 'John',
        lastName: 'Doe',
        birthDate: DateTime(1990, 5, 15),
        addresses: const ['address1'],
      );

      final user3 = User(
        id: '2',
        firstName: 'John',
        lastName: 'Doe',
        birthDate: DateTime(1990, 5, 15),
        addresses: const ['address1'],
      );

      // assert
      expect(user1, equals(user2));
      expect(user1, isNot(equals(user3)));
    });

    test('copyWith should create new instance with updated values', () {
      // arrange & act
      final updatedUser = testUser.copyWith(
        firstName: 'Jane',
        lastName: 'Smith',
      );

      // assert
      expect(updatedUser.id, testUser.id);
      expect(updatedUser.firstName, 'Jane');
      expect(updatedUser.lastName, 'Smith');
      expect(updatedUser.birthDate, testUser.birthDate);
      expect(updatedUser.addresses, testUser.addresses);
    });

    test('copyWith should keep original values when no changes provided', () {
      // arrange & act
      final updatedUser = testUser.copyWith();

      // assert
      expect(updatedUser, equals(testUser));
    });
  });
}
