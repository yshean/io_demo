import 'dart:ui';

import 'package:flutter/material.dart';

class CanvasPainting extends StatefulWidget {
  // const CanvasPainting({Key? key}) : super(key: key);

  @override
  _CanvasPaintingState createState() => _CanvasPaintingState();
}

class _CanvasPaintingState extends State<CanvasPainting> {
  // List of points touched on screen
  List<TouchPoint?> points = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Main canvas goes here
      body: GestureDetector(
        child: CustomPaint(
          size: Size.infinite,
          painter: MyPainter(points),
        ),
        onPanUpdate: (details) {
          setState(() {
            RenderBox renderBox = context.findRenderObject() as RenderBox;
            points.add(TouchPoint(
                renderBox.globalToLocal(details.globalPosition),
                Paint()
                  ..strokeCap = StrokeCap.round
                  ..isAntiAlias = true
                  ..color = Colors.black
                  ..strokeWidth = 3.0));
          });
        },
        onPanEnd: (details) => points.add(null),
      ),
    );
  }
}

/// Holds the point information where screen is being touched.
class TouchPoint {
  final Offset point;
  final Paint paint;

  TouchPoint(this.point, this.paint);
}

/// Tells how and when the screen will be painted.
/// When two consecutive points are available, a line is detected
/// otherwise a point is drawn.
class MyPainter extends CustomPainter {
  // Keep track of the points tapped on screen
  final List<TouchPoint?> points;

  MyPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(
          points[i]!.point,
          points[i + 1]!.point,
          points[i]!.paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
