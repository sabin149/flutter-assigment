
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/pages/auth/login.dart';


void main() {
  testWidgets('Login Page Testing', (WidgetTester tester) async {

    await tester.pumpWidget(const MaterialApp(home:Login()));

    expect(find.text("Forgot Password?"), findsOneWidget);

  }); 
}
