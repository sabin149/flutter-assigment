
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/pages/upload.dart';

void main() {
  testWidgets('Upload Page Testing', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home:Upload()));
    expect(find.text("Upload Post"), findsOneWidget);
  }); 
}
