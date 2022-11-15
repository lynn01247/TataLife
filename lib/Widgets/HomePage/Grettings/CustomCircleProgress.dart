import 'dart:math';
import 'package:flutter/material.dart';

double maxHeight = 0.0;
class CustomCircleProgress extends StatelessWidget {
  CustomCircleProgress(double height, {Key? key}) : super(key: key) {
    maxHeight = height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 360,
          height: 180,
          child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(seconds: 3),
            builder: (BuildContext context, double value, Widget? child) {
              return CustomPaint(
                painter: _CircleProgressPainter(value),
                child: Center(child: Text('${(value * 100).floor()}%')),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CircleProgressPainter extends CustomPainter {
  final double progress;

  _CircleProgressPainter(this.progress);

  Paint _paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 10
    ..color = Color(0xFFD32D2F)
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    double radius = min(size.width, size.height) / 2;
    Gradient gradient = SweepGradient(
      startAngle: -pi / 2,
      endAngle: pi * 2 * progress,
      colors: [Color(0xFFD32D2F), Color(0xFFEA4886),],
    );
    // var rect = Rect.fromLTWH(0, 0, radius * 2, radius * 2);
    var rect = RRect.fromLTRBR(0, -70, 175, size.width, const Radius.circular(50.0));
    // _paint.shader = gradient.createShader(rect);

    canvas.save();
    canvas.translate(0.0, size.height);
    canvas.rotate(-pi / 2);
    canvas.drawRRect(rect, _paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}