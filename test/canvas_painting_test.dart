// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:io_demo/canvas_painting.dart';

// First time run or when implementation changes
// need to update source of truth (the golden file)
// run flutter test --update-goldens
void main() {
  testWidgets('Canvas painting renders correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: CanvasPainting(),
    ));

    // Verify that our canvas starts blank.
    // Golden file testing
    await expectLater(
      find.byType(CanvasPainting),
      matchesGoldenFile('goldens/canvas_painting.initial.png'),
    );

    // Drag around the canvas and trigger a frame.
    await tester.drag(find.byType(CanvasPainting), const Offset(50.0, 100.0));
    await tester.pumpAndSettle();

    // Verify that our canvas has some drawing.
    await expectLater(
      find.byType(CanvasPainting),
      matchesGoldenFile('goldens/canvas_painting.after_drag.png'),
    );
  });
}
