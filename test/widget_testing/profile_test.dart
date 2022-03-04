import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/pages/bottom_navbar.dart';

void main() {
  testWidgets('BottomNavbar Page Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: BottomNavigationbar()));
    final scaffold =
        find.byKey(const Key('scaffold'));
    expect(scaffold, findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.people), findsOneWidget);
    expect(find.byIcon(Icons.search_rounded), findsOneWidget);
    expect(find.byIcon(Icons.file_upload_sharp), findsOneWidget);
  });
}
