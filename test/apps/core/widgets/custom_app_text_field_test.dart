
import 'package:doctor_hunt/apps/core/widgets/custom_app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomAppTextField', () {
    testWidgets('displays the hint text', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomAppTextField(
              hintText: 'Enter your email',
            ),
          ),
        ),
      );

      expect(find.text('Enter your email'), findsOneWidget);
    });

    testWidgets('accepts text input', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomAppTextField(
              hintText: 'Enter your name',
              controller: controller,
            ),
          ),
        ),
      );

      await tester.enterText(
        find.byType(EditableText),
        'Mohamed',
      );

      expect(controller.text, 'Mohamed');

      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
    });

    testWidgets('uses email keyboard for email type', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomAppTextField(
              hintText: 'Email',
              type: AppTextFieldType.email,
            ),
          ),
        ),
      );

      final editableText = tester.widget<EditableText>(
        find.byType(EditableText),
      );

      expect(
        editableText.keyboardType,
        TextInputType.emailAddress,
      );
    });

    testWidgets('hides password by default and toggles visibility', (
      tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomAppTextField(
              hintText: 'Password',
              type: AppTextFieldType.password,
            ),
          ),
        ),
      );

      var editableText = tester.widget<EditableText>(
        find.byType(EditableText),
      );

      expect(editableText.obscureText, isTrue);

      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      editableText = tester.widget<EditableText>(
        find.byType(EditableText),
      );

      expect(editableText.obscureText, isFalse);
      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });

    testWidgets('supports multiline input', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomAppTextField(
              hintText: 'Write a description',
              type: AppTextFieldType.multiline,
            ),
          ),
        ),
      );

      final editableText = tester.widget<EditableText>(
        find.byType(EditableText),
      );

      expect(editableText.maxLines, 4);
      expect(editableText.minLines, 3);
      expect(
        editableText.keyboardType,
        TextInputType.multiline,
      );
      expect(
        editableText.textInputAction,
        TextInputAction.newline,
      );
    });

    testWidgets('calls onChanged when text changes', (tester) async {
      String? changedValue;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomAppTextField(
              hintText: 'Name',
              onChanged: (value) => changedValue = value,
            ),
          ),
        ),
      );

      await tester.enterText(
        find.byType(EditableText),
        'Ahmed',
      );

      expect(changedValue, 'Ahmed');
    });

    testWidgets('shows validation error when validator fails', (
      tester,
    ) async {
      final formKey = GlobalKey<FormState>();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Form(
              key: formKey,
              child: CustomAppTextField(
                hintText: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }

                  return null;
                },
              ),
            ),
          ),
        ),
      );

      expect(formKey.currentState!.validate(), isFalse);
      await tester.pump();

      expect(find.text('Email is required'), findsOneWidget);
    });
  });
}
