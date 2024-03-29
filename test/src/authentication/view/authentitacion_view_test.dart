import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integrationtest/src/authentication/view/authentication_view.dart';

void main() {
  group("Authentication View UI", () {
    testWidgets(
        'GIVEN the authentication UI is open '
        'THEN I see a username input field '
        'AND I see a password input field '
        'AND I see a login button ', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AuthenticationView(),
        ),
      );
      await tester.pump();
      expect(find.byKey(AuthenticationViewConstants.userNameKey), findsOneWidget);
      expect(find.byKey(AuthenticationViewConstants.passwordKey), findsOneWidget);
      expect(find.byKey(AuthenticationViewConstants.loginButtonKey), findsOneWidget);
    });
    testWidgets(
        'GIVEN the authentication UI is open '
        'WHEN I type a value into the password field  '
        'THEN I see the password obscurd ', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AuthenticationView(),
        ),
      );
      await tester.pump();
      final passwordTextFormField = find.descendant(
        of: find.byKey(AuthenticationViewConstants.passwordKey),
        matching: find.byType(EditableText),
      );
      final input = tester.widget<EditableText>(passwordTextFormField);
      expect(input.obscureText, true);
    });
    testWidgets(
        'GIVEN the authentication UI is open '
        'WHEN I click on sign in button without type any data '
        'THEN I see error messages  ', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AuthenticationView(),
        ),
      );
      final loginButton = find.byKey(AuthenticationViewConstants.loginButtonKey);
      await tester.tap(loginButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(find.text('Enter a valid email address'), findsOneWidget);
      expect(find.text('Enter a valid password'), findsOneWidget);
    });

    testWidgets(
        'GIVEN the authentication UI is open '
        'WHEN I type a corrent e-mail '
        'AND I type an incorrent password'
        'THEN I see error messages ', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AuthenticationView(),
        ),
      );
      await tester.enterText(find.byKey(AuthenticationViewConstants.userNameKey), "matheusdeveloper.henrique@gmail.com");
      await tester.enterText(find.byKey(AuthenticationViewConstants.passwordKey), "1234567");
      final loginButton = find.byKey(AuthenticationViewConstants.loginButtonKey);
      await tester.tap(loginButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(find.text('Enter a valid password'), findsOneWidget);
    });
    testWidgets(
        'GIVEN the authentication UI is open '
        'WHEN I type an incorrent e-mail '
        'AND I type a corrent password'
        'THEN I see error messages ', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AuthenticationView(),
        ),
      );
      await tester.enterText(find.byKey(AuthenticationViewConstants.userNameKey), "matheusdeveloper12313");
      await tester.enterText(find.byKey(AuthenticationViewConstants.passwordKey), "12345678");
      final loginButton = find.byKey(AuthenticationViewConstants.loginButtonKey);
      await tester.tap(loginButton);
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(find.text('Enter a valid email address'), findsOneWidget);
    });
  });
}
