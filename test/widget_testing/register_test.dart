import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/pages/auth/register.dart';

void main() {
  testWidgets('Register Page Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Register()));
    final signupButton = find.byKey(const Key('signupButton'));

    final fullnameField = find.byKey(const Key('email'));
    final usernameField = find.byKey(const Key('email'));
    final emailField = find.byKey(const Key('email'));
    final passwordField = find.byKey(const Key('password'));

    await tester.enterText(fullnameField, 'user01');
    await tester.enterText(usernameField, 'user01');
    await tester.enterText(emailField, 'user01@gmail.com');
    await tester.enterText(passwordField, '123456');
    await tester.tap(signupButton);

    final container = find.byKey(const Key('container'));
    expect(container, findsOneWidget);
  });
}
