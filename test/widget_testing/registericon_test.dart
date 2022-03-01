
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/pages/search/search.dart';


void main() {
  testWidgets('Search Page Testing', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home:Search()));
    expect(find.byIcon(Icons.search), findsOneWidget);

  }); 
}
 