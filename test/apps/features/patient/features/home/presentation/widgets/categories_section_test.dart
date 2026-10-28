
import 'package:doctor_hunt/apps/features/patient/features/home/data/model/categories_data.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/widgets/categories_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CategoriesSection', () {
    testWidgets('displays all category cards', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 400,
              child: _CategoriesSectionHost(),
            ),
          ),
        ),
      );

      final categories = CategoriesData().categories;

      expect(
        find.byType(Image),
        findsNWidgets(categories.length),
      );

      expect(
        find.byType(SingleChildScrollView),
        findsOneWidget,
      );
    });

    testWidgets('uses horizontal scrolling', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoriesSection(),
          ),
        ),
      );

      final scrollView = tester.widget<SingleChildScrollView>(
        find.byType(SingleChildScrollView),
      );

      expect(scrollView.scrollDirection, Axis.horizontal);
    });

    testWidgets('renders category images using asset images', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoriesSection(),
          ),
        ),
      );

      expect(
        find.byType(Image),
        findsNWidgets(CategoriesData().categories.length),
      );

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Image && widget.image is AssetImage,
        ),
        findsNWidgets(CategoriesData().categories.length),
      );
    });

    testWidgets('does not throw during initial build', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CategoriesSection(),
          ),
        ),
      );

      expect(tester.takeException(), isNull);
    });
  });
}

class _CategoriesSectionHost extends StatelessWidget {
  const _CategoriesSectionHost();

  @override
  Widget build(BuildContext context) {
    return CategoriesSection();
  }
}
