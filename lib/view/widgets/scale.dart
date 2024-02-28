import 'package:flutter/material.dart';
import 'dart:math' as math;


class HealthScale extends StatelessWidget {
  final double value;
  final double size,leftSize,topSize;
  final Widget? petImage;

  const HealthScale({Key? key, required this.value, required this.size,required this.leftSize, required this.topSize, this.petImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Positioned(
      left: screenSize.width*leftSize,
      top: screenSize.height*topSize,//0.55
        child: Stack(
          children: [
            Center(
              child: CustomPaint(
                size: Size(screenSize.width*size, screenSize.height*size),
                painter: HealthScalePainter(value: value),
              ),
            ),
            if (petImage != null) Center(child: petImage),
          ],
        ),
    );
  }
}

class HealthScalePainter extends CustomPainter {
  final double value;

  HealthScalePainter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width /2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2);
    final strokeWidth = radius / 5;

    final backgroundPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final filledArcPaint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.green, Colors.yellow, Colors.red],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    final sweepAngle = math.pi * 2 * (value / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweepAngle,
      false,
      filledArcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}