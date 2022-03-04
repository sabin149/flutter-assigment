import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/pages/search/search.dart';

void main() {
  testWidgets('Search Page Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Search()));
    final searchButton = find.byKey(const Key('searchButton'));
    final searchField = find.byKey(const Key('search'));
    await tester.enterText(searchField, 'user');
    await tester.tap(searchButton);

    final container = find.byKey(const Key('container'));
    expect(container, findsOneWidget);
    final safearea = find.byKey(const Key('safearea'));
    expect(safearea, findsOneWidget);
  });
}
