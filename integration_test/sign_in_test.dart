import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integrationtest/src/app.dart';
import 'package:integrationtest/src/authentication/view/authentication_view.dart';
import 'package:integrationtest/src/home/view/home_view.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Sign In App', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pumpAndSettle();
    expect(find.byKey(AuthenticationViewConstants.userNameKey), findsOneWidget);
    expect(find.byKey(AuthenticationViewConstants.passwordKey), findsOneWidget);
    expect(find.byKey(AuthenticationViewConstants.loginButtonKey), findsOneWidget);
    await tester.enterText(find.byKey(AuthenticationViewConstants.userNameKey), "matheusdeveloper.henrique@gmail.com");
    await tester.pump(const Duration(seconds: 2));
    await tester.enterText(find.byKey(AuthenticationViewConstants.passwordKey), "integrationtestpassword");
    await tester.pump(const Duration(seconds: 2));
    await tester.tap(find.byKey(AuthenticationViewConstants.loginButtonKey));
    await tester.pump(const Duration(seconds: 2));
    expect(find.byKey(HomeViewConstants.homeCenterWidgetKey), findsOneWidget);
    await tester.pump(const Duration(seconds: 2));
  });
}
