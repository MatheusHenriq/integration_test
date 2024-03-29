import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integrationtest/src/home/view/home_view.dart';

void main() {
  group("Home View UI", () {
    testWidgets(
        'GIVEN the Home UI is open '
        'THEN I see a text in the middle of the screen ', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomeView(),
        ),
      );
      await tester.pump();
      expect(find.byKey(HomeViewConstants.homeCenterWidgetKey), findsOneWidget);
    });
  });
}
