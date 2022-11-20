import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

bool hasInit = false;
double progressTemp = 0.0;

class CustomCircleProgress extends StatelessWidget {

  double radius;            // 圆的半径
  double strokeWidth;       //画笔的宽度，其实是进度条的高度
  double viewWidth;         // 控件总宽度
  double progress;          // 进度
  Color backgroundColor;    //进度条背景色
  bool strokeCapRound;      // 顶端是否圆角
  Color color; //进度条颜色

  CustomCircleProgress({
    Key? key,
    required this.viewWidth,            // 控件总宽度
    required this.progress,             // 进度
    this.radius = 0.0,                  // 圆的半径
    this.strokeWidth = 2.0,             // 画笔的宽度，其实是进度条的高度
    this.color = Colors.red,           // 进度条颜色
    this.strokeCapRound = false,        // 顶端是否圆角
    this.backgroundColor = Colors.grey, // 进度条背景色
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWidth = 0.0;
    // maxWidth = viewWidth;
    maxWidth = viewWidth - (strokeWidth * 2);
    radius = maxWidth / 12; // 半径

    FocusScope.of(context).requestFocus(FocusNode());
    Widget widget = Scaffold(
      body: Center(
        child: Container(
          color: HexColor('#f9f6e8'),
          width: maxWidth,
          height: maxWidth / 2,
            child: TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: progress),
              duration: const Duration(seconds: 5),
              builder: (BuildContext context, double value, Widget? child) {
                return CustomPaint(
                  painter: _CircleProgressPainter(
                    mRadius: radius,
                    progress: value,
                    strokeWidth: strokeWidth,
                    strokeCapRound: strokeCapRound,
                    backgroundColor: backgroundColor,
                    color: color,
                  ),
                  child: Center(child: Text('${(value * 100).floor()}%',)),
                );
              },
            ),
          )
        ),
      );
    return widget;
  }
}

class _CircleProgressPainter extends CustomPainter {
  final double progress;// 进度
  final double mRadius; // 圆的半径
  final double strokeWidth; //画笔的宽度，其实是进度条的高度

  final Color backgroundColor;//进度条背景色
  final bool strokeCapRound;// 顶端是否圆角
  final Color color;//进度条颜色

  _CircleProgressPainter({
    Key? key,
    required this.mRadius,
    required this.progress,
    this.strokeWidth = 2.0,
    this.color = Colors.red,
    this.strokeCapRound = false,
    this.backgroundColor = Colors.grey,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double offSet = (strokeWidth / 4); // 距离边框的padding
    double c1 = 2 * mRadius / 4 * pi; // 第1部分的周长
    double c2 = 2 * mRadius / 4 * pi + 10 * mRadius; // 第2部分的周长
    double c3 = 2 * 2 * mRadius / 4 * pi + 10 * mRadius; // 第3部分的周长
    double c4 = 2 * 2 * mRadius / 4 * pi + 14 * mRadius; // 第4部分的周长
    double c5 = 2 * 3 * mRadius / 4 * pi + 14 * mRadius; // 第5部分的周长
    double c6 = 2 * 3 * mRadius / 4 * pi + 24 * mRadius; // 第6部分的周长
    double c7 = 2 * 4 * mRadius / 4 * pi + 24 * mRadius; // 第7部分的周长
    double circumference = 2 * 4 * pi / 4 * mRadius + 14 * 2 * mRadius; // 总周长
    final Paint _paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = backgroundColor
      ..strokeCap = StrokeCap.round;
    final Paint _paint1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = color
      ..strokeCap = StrokeCap.round;
    var rectLeftTop = Rect.fromCircle(center: Offset(mRadius + offSet, mRadius + offSet),radius: mRadius);
    var rectRightTop = Rect.fromCircle(center: Offset(11*mRadius-offSet,mRadius+offSet),radius: mRadius);
    var rectRightBottom = Rect.fromCircle(center: Offset(11*mRadius-offSet,5*mRadius-offSet),radius: mRadius);
    var rectLeftBottom = Rect.fromCircle(center: Offset(mRadius+offSet,5*mRadius-offSet),radius: mRadius);
    canvas.drawColor(HexColor('#f9f6e8'), BlendMode.darken);
    canvas.save();
    canvas.drawArc(rectLeftTop, -pi, pi/2, false, _paint); // 先回退-180°再开始转90°【1】
    canvas.drawLine(Offset(mRadius + offSet,offSet), Offset(11*mRadius - offSet, offSet), _paint);//【2】
    canvas.drawArc(rectRightTop, -pi/2, pi/2, false, _paint); // -先回退-90°再开始转90°【3】
    canvas.drawLine(Offset(size.width-offSet,mRadius+offSet), Offset(size.width-offSet,5*mRadius-offSet), _paint);//【4】
    canvas.drawArc(rectRightBottom, 0, pi/2, false, _paint); // 先回退0°再开始转90°【5】
    canvas.drawLine(Offset(mRadius + offSet,size.width/2-offSet), Offset(11*mRadius-offSet,size.width/2-offSet), _paint);//【6】
    canvas.drawArc(rectLeftBottom, pi/2, pi/2, false, _paint); // 先前进90°再开始转90°【7】
    canvas.drawLine(Offset(offSet,mRadius+offSet), Offset(offSet,5*mRadius-offSet), _paint);//【8】
    if (progress <= c1/circumference){ // 落在第1部分
      canvas.drawArc(rectLeftTop, -pi , pi / 2  * (circumference/c1) * progress, false, _paint1);
    } else if (progress > c1/circumference && progress <= c2/circumference){ // 落在第2部分
      progressTemp = progress - c1/circumference;
      canvas.drawArc(rectLeftTop, -pi , pi / 2, false, _paint1);
      canvas.drawLine(Offset(mRadius + offSet,offSet), Offset(mRadius + (11*mRadius - offSet - mRadius) * (circumference/(c2-c1)) * progressTemp, offSet), _paint1);//【2】
    } else if (progress > c2/circumference && progress <= c3/circumference){ // 落在第3部分
      progressTemp = progress - c2/circumference;
      canvas.drawArc(rectLeftTop, -pi , pi / 2, false, _paint1);
      canvas.drawLine(Offset(mRadius + offSet,offSet), Offset(11*mRadius - offSet, offSet), _paint1);
      canvas.drawArc(rectRightTop, -pi/2, pi/2 *(circumference/(c3-c2)) * progressTemp, false, _paint1); // -先回退-90°再开始转90°【3】
    } else if (progress > c3/circumference && progress <= c4/circumference){ // 落在第4部分
      progressTemp = progress - c3/circumference;
      canvas.drawArc(rectLeftTop, -pi , pi / 2, false, _paint1);
      canvas.drawLine(Offset(mRadius + offSet,offSet), Offset(11*mRadius - offSet, offSet), _paint1);
      canvas.drawArc(rectRightTop, -pi/2, pi/2, false, _paint1);
      canvas.drawLine(Offset(size.width-offSet,mRadius+offSet), Offset(size.width-offSet,(mRadius+offSet) + (5*mRadius-offSet-(mRadius+offSet)) *((circumference)/(c4 - c3)) * progressTemp), _paint1);//【4】
    } else if (progress > c4/circumference && progress <= c5/circumference){ // 落在第5部分
      progressTemp = progress - c4/circumference;
      canvas.drawArc(rectLeftTop, -pi , pi / 2, false, _paint1);
      canvas.drawLine(Offset(mRadius + offSet,offSet), Offset(11*mRadius - offSet, offSet), _paint1);
      canvas.drawArc(rectRightTop, -pi/2, pi/2, false, _paint1);
      canvas.drawLine(Offset(size.width-offSet,mRadius+offSet), Offset(size.width-offSet,5*mRadius-offSet), _paint1);
      canvas.drawArc(rectRightBottom, 0, pi/2 *(circumference/(c5-c4)) * progressTemp, false, _paint1); // 先回退0°再开始转90°【5】
    } else if (progress > c5/circumference && progress <= c6/circumference){ // 落在第6部分
      progressTemp = progress - c5/circumference;
      canvas.drawArc(rectLeftTop, -pi , pi / 2, false, _paint1);
      canvas.drawLine(Offset(mRadius + offSet,offSet), Offset(11*mRadius - offSet, offSet), _paint1);
      canvas.drawArc(rectRightTop, -pi/2, pi/2, false, _paint1);
      canvas.drawLine(Offset(size.width-offSet,mRadius+offSet), Offset(size.width-offSet,5*mRadius-offSet), _paint1);
      canvas.drawArc(rectRightBottom, 0, pi/2, false, _paint1);
      canvas.drawLine(Offset(11*mRadius-offSet,size.width/2-offSet), Offset((11*mRadius-offSet) - ((11*mRadius-offSet) - (mRadius + offSet)) *(circumference/(c6 - c5)) * progressTemp,size.width/2-offSet), _paint1);//【6】
    } else if (progress > c6/circumference && progress <= c7/circumference){ // 落在第7部分
      progressTemp = progress - c6/circumference;
      canvas.drawArc(rectLeftTop, -pi , pi / 2, false, _paint1);
      canvas.drawLine(Offset(mRadius + offSet,offSet), Offset(11*mRadius - offSet, offSet), _paint1);
      canvas.drawArc(rectRightTop, -pi/2, pi/2, false, _paint1);
      canvas.drawLine(Offset(size.width-offSet,mRadius+offSet), Offset(size.width-offSet,5*mRadius-offSet), _paint1);
      canvas.drawArc(rectRightBottom, 0, pi/2, false, _paint1);
      canvas.drawLine(Offset(mRadius + offSet,size.width/2-offSet), Offset(11*mRadius-offSet,size.width/2-offSet), _paint1);
      canvas.drawArc(rectLeftBottom, pi/2, pi/2 *(circumference/(c7 - c6)) * progressTemp, false, _paint1); // 先前进90°再开始转90°【7】
    } else {  // 落在最后部分
      progressTemp = progress - c7/circumference;
      canvas.drawArc(rectLeftTop, -pi , pi / 2, false, _paint1);
      canvas.drawLine(Offset(mRadius + offSet,offSet), Offset(11*mRadius - offSet, offSet), _paint1);
      canvas.drawArc(rectRightTop, -pi/2, pi/2, false, _paint1);
      canvas.drawLine(Offset(size.width-offSet,mRadius+offSet), Offset(size.width-offSet,5*mRadius-offSet), _paint1);
      canvas.drawArc(rectRightBottom, 0, pi/2, false, _paint1);
      canvas.drawLine(Offset(mRadius + offSet,size.width/2-offSet), Offset(11*mRadius-offSet,size.width/2-offSet), _paint1);
      canvas.drawArc(rectLeftBottom, pi/2, pi/2, false, _paint1);
      canvas.drawLine(Offset(offSet,5*mRadius-offSet), Offset(offSet,(5*mRadius-offSet) - ((5*mRadius-offSet) - (mRadius+offSet)) *(circumference/(circumference - c7)) * progressTemp), _paint1);//【8】
    }
    hasInit = true;
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}