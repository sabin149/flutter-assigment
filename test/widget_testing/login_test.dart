import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/pages/auth/login.dart';

void main() {
  testWidgets('Login Page Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Login()));
    final loginButton = find.byKey(const Key('loginButton'));
    final usernameField = find.byKey(const Key('email'));
    final passwordField = find.byKey(const Key('password'));

    await tester.enterText(usernameField, 'user01@gmail.com');
    await tester.enterText(passwordField, '123456');
    await tester.tap(loginButton);

     final container = find.byKey(const Key('container'));
    expect(container, findsOneWidget);
  });
}
