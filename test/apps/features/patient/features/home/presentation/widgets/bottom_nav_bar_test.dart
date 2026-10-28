
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/features/patient/features/home/presentation/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BottomNavBar', () {
    Widget createWidget({
      int currentIndex = 0,
      ValueChanged<int>? onTap,
    }) {
      return MaterialApp(
        home: Scaffold(
          bottomNavigationBar: BottomNavBar(
            currentIndex: currentIndex,
            onTap: onTap ?? (_) {},
          ),
        ),
      );
    }

    testWidgets('displays all four navigation icons', (tester) async {
      await tester.pumpWidget(createWidget());

      expect(find.byIcon(Icons.home_sharp), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsOneWidget);
      expect(find.byIcon(Icons.menu_book_outlined), findsOneWidget);
      expect(find.byIcon(Icons.chat_rounded), findsOneWidget);
    });

    testWidgets('highlights the selected navigation item', (tester) async {
      await tester.pumpWidget(
        createWidget(currentIndex: 1),
      );

      final selectedIcon = tester.widget<Icon>(
        find.byIcon(Icons.favorite),
      );

      expect(selectedIcon.color, AppColors.white);

      final unselectedIcon = tester.widget<Icon>(
        find.byIcon(Icons.home_sharp),
      );

      expect(unselectedIcon.color, AppColors.textNavigation);
    });

    testWidgets('calls onTap with the selected index', (tester) async {
      int? selectedIndex;

      await tester.pumpWidget(
        createWidget(
          currentIndex: 0,
          onTap: (index) => selectedIndex = index,
        ),
      );

      await tester.tap(find.byIcon(Icons.favorite));
      await tester.pump();

      expect(selectedIndex, 1);
    });

    testWidgets('updates the selected item when currentIndex changes', (
      tester,
    ) async {
      await tester.pumpWidget(
        createWidget(currentIndex: 0),
      );

      expect(
        tester.widget<Icon>(
          find.byIcon(Icons.home_sharp),
        ).color,
        AppColors.white,
      );

      await tester.pumpWidget(
        createWidget(currentIndex: 2),
      );

      expect(
        tester.widget<Icon>(
          find.byIcon(Icons.menu_book_outlined),
        ).color,
        AppColors.white,
      );

      expect(
        tester.widget<Icon>(
          find.byIcon(Icons.home_sharp),
        ).color,
        AppColors.textNavigation,
      );
    });

    testWidgets('does not display navigation labels', (tester) async {
      await tester.pumpWidget(createWidget());

      final navigationBar = tester.widget<BottomNavigationBar>(
        find.byType(BottomNavigationBar),
      );

      expect(navigationBar.showSelectedLabels, isFalse);
      expect(navigationBar.showUnselectedLabels, isFalse);
      expect(navigationBar.type, BottomNavigationBarType.fixed);
    });
  });
}
