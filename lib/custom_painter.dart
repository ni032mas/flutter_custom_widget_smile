import 'package:flutter/material.dart';
import 'dart:math' as math;

class Smile extends StatelessWidget {
  final isNice;

  Smile({this.isNice});

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: SmilePainter(isNice: isNice),
        size: Size(300, 300),
      );
}

class SmilePainter extends CustomPainter {
  final isNice;

  SmilePainter({this.isNice});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = math.min(size.width, size.height) / 2;
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()..color = isNice ? Colors.green : Colors.red;
    final eyePaint = Paint()..color = Colors.black;
    final smilePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawCircle(center, radius, paint);
    canvas.drawCircle(
        Offset(center.dx - radius / 3, center.dy - radius / 3), 20, eyePaint);
    canvas.drawCircle(
        Offset(center.dx + radius / 3, center.dy - radius / 3), 20, eyePaint);
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(
                center.dx, center.dy + (isNice ? radius / 4 : radius / 2)),
            radius: radius / 3),
        isNice ? math.pi / 6 : 7 * math.pi / 6,
        2 * math.pi / 3,
        false,
        smilePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
