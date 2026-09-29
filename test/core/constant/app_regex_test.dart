import 'package:doctor_hunt/apps/Patient/core/constant/app_regex.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppRegex', () {
    group('isEmailValid', () {
      test('accepts valid email addresses and trims whitespace', () {
        expect(AppRegex.isEmailValid('test@example.com'), isTrue);
        expect(AppRegex.isEmailValid('user.name+tag@example.co'), isTrue);
        expect(AppRegex.isEmailValid(' admin@doctor-hunt.co '), isTrue);
      });

      test('rejects malformed email addresses', () {
        expect(AppRegex.isEmailValid(''), isFalse);
        expect(AppRegex.isEmailValid('test@example'), isFalse);
        expect(AppRegex.isEmailValid('test@.com'), isFalse);
        expect(AppRegex.isEmailValid('test@@example.com'), isFalse);
      });
    });

    group('isPasswordValid', () {
      test('accepts passwords with all required character types and length', () {
        expect(AppRegex.isPasswordValid('Abcdef12!'), isTrue);
        expect(AppRegex.isPasswordValid('StrongPass1@'), isTrue);
      });

      test('rejects passwords missing a requirement', () {
        expect(AppRegex.isPasswordValid('abcde12!'), isFalse);
        expect(AppRegex.isPasswordValid('Abcdefgh!'), isFalse);
        expect(AppRegex.isPasswordValid('Abcdef12'), isFalse);
        expect(AppRegex.isPasswordValid('abcdef12!'), isFalse);
      });
    });

    test('hasLowerCase detects lowercase letters', () {
      expect(AppRegex.hasLowerCase('Abcdef1!'), isTrue);
      expect(AppRegex.hasLowerCase('ABCDEF1!'), isFalse);
    });

    test('hasUpperCase detects uppercase letters', () {
      expect(AppRegex.hasUpperCase('abcDEF1!'), isTrue);
      expect(AppRegex.hasUpperCase('abcdef1!'), isFalse);
    });

    test('hasNumber detects digits', () {
      expect(AppRegex.hasNumber('Abcdef1!'), isTrue);
      expect(AppRegex.hasNumber('Abcdef!'), isFalse);
    });

    test('hasSpecialCharacter detects supported special symbols', () {
      expect(AppRegex.hasSpecialCharacter('Abcdef1!'), isTrue);
      expect(AppRegex.hasSpecialCharacter('Abcdef12'), isFalse);
    });

    test('hasMinLength requires at least eight characters', () {
      expect(AppRegex.hasMinLength('Abcdef1!'), isTrue);
      expect(AppRegex.hasMinLength('Abc1!'), isFalse);
    });
  });
}
