import 'package:doctor_hunt/apps/Patient/core/extension/validator_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ValidatorExtension', () {
    test('validateName should reject null, empty and whitespace values', () {
      const emptyMessage = 'Name is required';
      String? value;

      expect(''.validateName(emptyMessage: emptyMessage), emptyMessage);
      expect('   '.validateName(emptyMessage: emptyMessage), emptyMessage);
      expect(value.validateName(emptyMessage: emptyMessage), emptyMessage);
      expect('Ahmed'.validateName(emptyMessage: emptyMessage), isNull);
    });

    test('validateEmail should validate empty, invalid and valid emails', () {
      const emptyMessage = 'Email is required';
      const invalidMessage = 'Email is invalid';
      String? value;

      expect(value.validateEmail(
        emptyMessage: emptyMessage,
        invalidMessage: invalidMessage,
      ), emptyMessage);
      expect(''.validateEmail(
        emptyMessage: emptyMessage,
        invalidMessage: invalidMessage,
      ), emptyMessage);
      expect('patient@doctor'.validateEmail(
        emptyMessage: emptyMessage,
        invalidMessage: invalidMessage,
      ), invalidMessage);
      expect(' patient@example.com '.validateEmail(
        emptyMessage: emptyMessage,
        invalidMessage: invalidMessage,
      ), isNull);
    });

    test('validatePassword should return the first invalid rule message', () {
      const emptyMessage = 'Password is required';

      expect(''.validatePassword(emptyMessage: emptyMessage), emptyMessage);
      expect('Ab1!'.validatePassword(emptyMessage: emptyMessage),
          'كلمة المرور يجب أن تكون 8 أحرف على الأقل');
      expect('abcdef1!'.validatePassword(emptyMessage: emptyMessage),
          'يجب أن تحتوي على حرف كبير');
      expect('Abcdefgh!'.validatePassword(emptyMessage: emptyMessage),
          'يجب أن تحتوي على رقم');
      expect('Abcdef12'.validatePassword(emptyMessage: emptyMessage),
          'يجب أن تحتوي على رمز خاص');
      expect('Abcdef12!'.validatePassword(emptyMessage: emptyMessage), isNull);
    });
  });
}
