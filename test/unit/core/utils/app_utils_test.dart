import 'package:doublev/core/utils/app_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateUtils Tests', () {
    test('dateToString should format date correctly', () {
      // arrange
      final date = DateTime(2023, 12, 25);

      // act
      final result = DateUtils.dateToString(date);

      // assert
      expect(result, '25/12/2023');
    });

    test('stringToDate should parse date string correctly', () {
      // arrange
      const dateString = '25/12/2023';

      // act
      final result = DateUtils.stringToDate(dateString);

      // assert
      expect(result, DateTime(2023, 12, 25));
    });

    test('stringToDate should return null for invalid date string', () {
      // arrange
      const invalidDateString = 'invalid-date';

      // act
      final result = DateUtils.stringToDate(invalidDateString);

      // assert
      expect(result, isNull);
    });

    test('isValidBirthDate should return true for valid past date', () {
      // arrange
      final validBirthDate = DateTime(1990, 5, 15);

      // act
      final result = DateUtils.isValidBirthDate(validBirthDate);

      // assert
      expect(result, isTrue);
    });

    test('isValidBirthDate should return false for future date', () {
      // arrange
      final futureDate = DateTime.now().add(const Duration(days: 1));

      // act
      final result = DateUtils.isValidBirthDate(futureDate);

      // assert
      expect(result, isFalse);
    });

    test('isValidBirthDate should return false for date before 1900', () {
      // arrange
      final oldDate = DateTime(1899, 12, 31);

      // act
      final result = DateUtils.isValidBirthDate(oldDate);

      // assert
      expect(result, isFalse);
    });

    test('isValidBirthDate should return false for null date', () {
      // act
      final result = DateUtils.isValidBirthDate(null);

      // assert
      expect(result, isFalse);
    });
  });

  group('ValidationUtils Tests', () {
    test('isValidName should return true for valid names', () {
      // arrange
      const validNames = ['John', 'María José', 'José Luis', 'Ana María'];

      // act & assert
      for (final name in validNames) {
        expect(ValidationUtils.isValidName(name), isTrue, reason: 'Name: $name should be valid');
      }
    });

    test('isValidName should return false for invalid names', () {
      // arrange
      const invalidNames = ['J', '', '  ', 'John123', 'John@', null];

      // act & assert
      for (final name in invalidNames) {
        expect(ValidationUtils.isValidName(name), isFalse, reason: 'Name: $name should be invalid');
      }
    });

    test('isNotEmpty should return true for non-empty strings', () {
      // arrange
      const validStrings = ['hello', 'world', 'test string'];

      // act & assert
      for (final str in validStrings) {
        expect(ValidationUtils.isNotEmpty(str), isTrue, reason: 'String: "$str" should not be empty');
      }
    });

    test('isNotEmpty should return false for empty or null strings', () {
      // arrange
      const invalidStrings = ['', '   ', null];

      // act & assert
      for (final str in invalidStrings) {
        expect(ValidationUtils.isNotEmpty(str), isFalse, reason: 'String: "$str" should be empty');
      }
    });
  });
}
