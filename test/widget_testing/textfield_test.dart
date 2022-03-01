import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/pages/auth/register.dart';

void main() {
  testWidgets('TextField Testing', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Register()));

    final tfWidget = find.byKey(const ValueKey("fullname"));

    await tester.enterText(tfWidget, "Sabin Dangal");

    expect(find.text("Sabin Dangal"), findsOneWidget);
  });
}
