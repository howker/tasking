import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:wundertusk/resources/app_colors.dart';

class ProgressCircle extends StatelessWidget {
  final double progress;
  final Color progressColor;
  final double radius;

  const ProgressCircle({
    required this.progress,
    required this.progressColor,
    required this.radius,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromRadius(radius),
      painter: ProgressCirclePainter(
        value: progress,
        progressFillColor: progressColor,
      ),
    );
  }
}

class ProgressCirclePainter extends CustomPainter {
  final Color progressFillColor;
  final Color progressBackgroundColor;
  final double value;

  const ProgressCirclePainter({
    required this.value,
    required this.progressFillColor,
    this.progressBackgroundColor = AppColors.kColBase3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    final startAngle = -math.pi / 2;
    final sweepAngle = math.pi * value * 2;
    const useCenter = false;
    final paint = Paint()
      ..color = progressBackgroundColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;

    canvas.drawArc(rect, startAngle, math.pi * 2, useCenter, paint);
    paint.color = progressFillColor;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
