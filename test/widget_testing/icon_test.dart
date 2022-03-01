
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/pages/home/home.dart';


void main() {
  testWidgets('Home Page Testing', (WidgetTester tester) async {

    await tester.pumpWidget(const MaterialApp(home:Home()));

    expect(find.byIcon(Icons.messenger), findsOneWidget);

  }); 
}
