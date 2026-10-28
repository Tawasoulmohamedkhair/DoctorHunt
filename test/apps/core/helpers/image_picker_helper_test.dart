import 'package:doctor_hunt/apps/core/helper/image_picker_helper.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('plugins.flutter.io/image_picker');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          if (call.method == 'pickImage') {
            return '/tmp/test_image.jpg';
          }

          return null;
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  group('ImagePickerHelper', () {
    test('returns an image when gallery selection succeeds', () async {
      final result = await ImagePickerHelper.pickFromGallery();

      expect(result, isA<XFile>());
      expect(result!.path, '/tmp/test_image.jpg');
    });

    test('requests image quality of 85 from gallery', () async {
      Map<dynamic, dynamic>? arguments;

      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (call) async {
            if (call.method == 'pickImage') {
              arguments = call.arguments as Map<dynamic, dynamic>;
              return '/tmp/test_image.jpg';
            }

            return null;
          });

      await ImagePickerHelper.pickFromGallery();

      expect(arguments, isNotNull);
      expect(arguments!['imageQuality'], 85);
      expect(arguments!['source'], ImageSource.gallery.index);
    });
  });
}
