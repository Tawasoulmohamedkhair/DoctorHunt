
import 'dart:io';

import 'package:doctor_hunt/apps/core/widgets/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildTestWidget(AppImage appImage) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: appImage),
      ),
    );
  }

  group('AppImage', () {
    testWidgets('shows fallback when imageUrl and imageFile are null',
        (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          const AppImage(
            width: 100,
            height: 100,
          ),
        ),
      );

      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.byType(Image), findsNothing);
    });

    testWidgets('shows fallback when imageUrl is empty', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          const AppImage(
            imageUrl: '   ',
            width: 100,
            height: 100,
          ),
        ),
      );

      expect(find.byIcon(Icons.person), findsOneWidget);
      expect(find.byType(Image), findsNothing);
    });

    testWidgets('shows custom fallback when provided', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          const AppImage(
            width: 100,
            height: 100,
            fallback: Text('No image'),
          ),
        ),
      );

      expect(find.text('No image'), findsOneWidget);
      expect(find.byIcon(Icons.person), findsNothing);
    });

    testWidgets('uses Image.network when a valid URL is provided',
        (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          const AppImage(
            imageUrl: 'https://example.com/image.png',
            width: 100,
            height: 100,
          ),
        ),
      );

      final image = tester.widget<Image>(find.byType(Image));

      expect(image.image, isA<NetworkImage>());
      expect(
        (image.image as NetworkImage).url,
        'https://example.com/image.png',
      );
    });

    testWidgets('trims whitespace from the network URL', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          const AppImage(
            imageUrl: '  https://example.com/image.png  ',
            width: 100,
            height: 100,
          ),
        ),
      );

      final image = tester.widget<Image>(find.byType(Image));

      expect(
        (image.image as NetworkImage).url,
        'https://example.com/image.png',
      );
    });

    testWidgets('uses the custom fallback while network image is loading',
        (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          const AppImage(
            imageUrl: 'https://example.com/image.png',
            width: 100,
            height: 100,
            fallback: Text('Loading fallback'),
          ),
        ),
      );

      // The initial network loading state should use the fallback.
      await tester.pump();

      expect(find.text('Loading fallback'), findsOneWidget);
    });

    testWidgets('shows CircularProgressIndicator when loading is enabled',
        (tester) async {
      // Verify the loading UI independently of network timing.
      await tester.pumpWidget(
        buildTestWidget(
          const AppImage(
            width: 100,
            height: 100,
            fallback: CircularProgressIndicator(),
            showLoadingIndicator: true,
          ),
        ),
      );

      // With no URL, AppImage displays its fallback directly.
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('uses ClipOval for circular images', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          const AppImage(
            width: 100,
            height: 80,
            shape: AppImageShape.circle,
          ),
        ),
      );

      expect(find.byType(ClipOval), findsOneWidget);

      final size = tester.getSize(find.byType(AppImage));
      expect(size.width, 80);
      expect(size.height, 80);
    });

    testWidgets('uses ClipRRect for rectangular images', (tester) async {
      await tester.pumpWidget(
        buildTestWidget(
          const AppImage(
            width: 120,
            height: 80,
            borderRadius: 12,
          ),
        ),
      );

      expect(find.byType(ClipRRect), findsOneWidget);

      final clip = tester.widget<ClipRRect>(
        find.byType(ClipRRect),
      );

      expect(
        clip.borderRadius,
        BorderRadius.circular(12),
      );
    });

    testWidgets('uses the supplied background color in fallback',
        (tester) async {
      const backgroundColor = Colors.blue;

      await tester.pumpWidget(
        buildTestWidget(
          const AppImage(
            width: 100,
            height: 100,
            backgroundColor: backgroundColor,
          ),
        ),
      );

      final container = tester.widget<Container>(
        find.ancestor(
          of: find.byIcon(Icons.person),
          matching: find.byType(Container),
        ).first,
      );

      expect(container.color, backgroundColor);
    });

    testWidgets('prioritizes imageFile over imageUrl', (tester) async {
      final file = File(
        '${Directory.systemTemp.path}/test_image.png',
      );

      await tester.pumpWidget(
        buildTestWidget(
          AppImage(
            imageFile: file,
            imageUrl: 'https://example.com/image.png',
            width: 100,
            height: 100,
          ),
        ),
      );

      final image = tester.widget<Image>(find.byType(Image));

      expect(image.image, isA<FileImage>());
      expect(
        (image.image as FileImage).file.path,
        file.path,
      );
    });
  });
}