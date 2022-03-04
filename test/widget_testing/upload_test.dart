import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/pages/upload/upload.dart';

void main() {
  testWidgets('Upload Page Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Upload()));
    final postButton = find.byKey(const Key('postButton'));
    final contentField = find.byKey(const Key('content'));

    await tester.enterText(contentField, 'this is post test');
    await tester.tap(postButton);
    final inkwell = find.byKey(const Key('inkwell'));
    expect(inkwell, findsOneWidget);
    final sizedbox = find.byKey(const Key('sizedbox'));
    expect(sizedbox, findsOneWidget);
  });
}
