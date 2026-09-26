import 'package:doctor_hunt/apps/Patient/core/constant/app_regex.dart';

extension ValidatorExtension on String? {
  String? validateName({required String emptyMessage}) {
    if (this == null || this!.trim().isEmpty) {
      return emptyMessage;
    }
    return null;
  }

  String? validateEmail({
    required String emptyMessage,
    required String invalidMessage,
  }) {
    if (this == null || this!.trim().isEmpty) {
      return emptyMessage;
    }
    if (!AppRegex.isEmailValid(this!.trim())) {
      return invalidMessage;
    }
    return null;
  }

  String? validatePassword({
    required String emptyMessage,
    String minLengthMessage = 'كلمة المرور يجب أن تكون 8 أحرف على الأقل',
    String lowerCaseMessage = 'يجب أن تحتوي على حرف صغير',
    String upperCaseMessage = 'يجب أن تحتوي على حرف كبير',
    String numberMessage = 'يجب أن تحتوي على رقم',
    String specialCharMessage = 'يجب أن تحتوي على رمز خاص',
  }) {
    if (this == null || this!.isEmpty) {
      return emptyMessage;
    }
    if (!AppRegex.hasMinLength(this!)) {
      return minLengthMessage;
    }
    if (!AppRegex.hasLowerCase(this!)) {
      return lowerCaseMessage;
    }
    if (!AppRegex.hasUpperCase(this!)) {
      return upperCaseMessage;
    }
    if (!AppRegex.hasNumber(this!)) {
      return numberMessage;
    }
    if (!AppRegex.hasSpecialCharacter(this!)) {
      return specialCharMessage;
    }
    return null;
  }
}
