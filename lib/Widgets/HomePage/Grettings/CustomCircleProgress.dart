import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

double maxWidth = 0.0;
double maxProgress = 0.0;
double progressTemp = 0.0;
double strokeWidth = 10.0; //画笔的宽度，其实是进度条的高度

double radius = 0.0; // 半径
double offSet = 0.0; // 距离边框的padding
double angleStart = 0.0;
double angleEnd = 0.0;
double a1 = 0.0;  // angleStart - a1
double a2 =  0.0;
double startAng = 0.0;
double endAng = 0.0;
double c1 = 0.0; // 第1部分的周长
double c2 = 0.0; // 第2部分的周长
double c3 = 0.0; // 第3部分的周长
double c4 = 0.0; // 第4部分的周长
double c5 = 0.0; // 第5部分的周长
double c6 = 0.0; // 第6部分的周长
double c7 = 0.0; // 第7部分的周长
double circumference =  0.0; // 总周长

Color backgroundColor = Colors.grey;//进度条背景色
List<Color> colors = const [Colors.red, Colors.purple];//渐变的颜色列表
bool hasInit = false;
class CustomCircleProgress extends StatelessWidget {

  CustomCircleProgress({Key? key, required width, required progress}) : super(key: key) {
    maxWidth = width - (strokeWidth * 2);
    maxProgress = progress;
    radius = maxWidth / 12; // 半径
    offSet = (strokeWidth / 4); // 距离边框的padding
    angleStart = atan((maxWidth / 2) / (2 * radius));
    angleEnd = atan((5 * radius) / (3 * radius));
    a1 = angleEnd - angleEnd; // angleStart - a1
    a2 = 0;

    startAng = 0.0;
    endAng = 0.0;
    c1 = 2 * radius / 4 * pi; // 第1部分的周长
    c2 = 2 * radius / 4 * pi + 10 * radius; // 第2部分的周长
    c3 = 2 * 2 * radius / 4 * pi + 10 * radius; // 第3部分的周长
    c4 = 2 * 2 * radius / 4 * pi + 14 * radius; // 第4部分的周长
    c5 = 2 * 3 * radius / 4 * pi + 14 * radius; // 第5部分的周长
    c6 = 2 * 3 * radius / 4 * pi + 24 * radius; // 第6部分的周长
    c7 = 2 * 4 * radius / 4 * pi + 24 * radius; // 第7部分的周长
    circumference = 2 * 4 * pi / 4 * radius + 14 * 2 * radius; // 总周长
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    Widget widget = Scaffold(
      body: Center(
        child: Container(
          color: HexColor('#f9f6e8'),
          width: maxWidth,
          height: maxWidth / 2,
            // child: CustomPaint(
            //       painter: _CircleProgressPainter(maxProgress),
            //       child: Center(child: Text('30%')),
            //     ),
            // ),
            child: TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: maxProgress),
              duration: const Duration(seconds: 5),
              builder: (BuildContext context, double value, Widget? child) {
                return CustomPaint(
                  painter: _CircleProgressPainter(value),
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
  final double progress;

  _CircleProgressPainter(this.progress);

  final Paint _paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth
    ..color = Colors.grey
    ..strokeCap = StrokeCap.round;
  final Paint _paint1 = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = strokeWidth
    ..color = Colors.red
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {

    Gradient sweep = SweepGradient(
      startAngle: -pi / 2,
      endAngle: pi / 4 * progress,
      colors: const [Colors.red, Colors.red],
    );
    Gradient line = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.red,Colors.red],
    );

    var rectLeftTop = Rect.fromCircle(center: Offset(radius + offSet, radius + offSet),radius: radius);
    var rectRightTop = Rect.fromCircle(center: Offset(11*radius-offSet,radius+offSet),radius: radius);
    var rectRightBottom = Rect.fromCircle(center: Offset(11*radius-offSet,5*radius-offSet),radius: radius);
    var rectLeftBottom = Rect.fromCircle(center: Offset(radius+offSet,5*radius-offSet),radius: radius);
    canvas.save();
    canvas.drawArc(rectLeftTop, -pi, pi/2, false, _paint); // 先回退-180°再开始转90°【1】
    canvas.drawLine(Offset(radius + offSet,offSet), Offset(11*radius - offSet, offSet), _paint);//【2】
    canvas.drawArc(rectRightTop, -pi/2, pi/2, false, _paint); // -先回退-90°再开始转90°【3】
    canvas.drawLine(Offset(size.width-offSet,radius+offSet), Offset(size.width-offSet,5*radius-offSet), _paint);//【4】
    canvas.drawArc(rectRightBottom, 0, pi/2, false, _paint); // 先回退0°再开始转90°【5】
    canvas.drawLine(Offset(radius + offSet,size.width/2-offSet), Offset(11*radius-offSet,size.width/2-offSet), _paint);//【6】
    canvas.drawArc(rectLeftBottom, pi/2, pi/2, false, _paint); // 先前进90°再开始转90°【7】
    canvas.drawLine(Offset(offSet,radius+offSet), Offset(offSet,5*radius-offSet), _paint);//【8】
    if(!hasInit && progress <= c3/circumference) print("Now progress is " + progress.toString());
    if(!hasInit) print("Now radius is " + (radius).toString());
    if(!hasInit) print("Now offSet is " + offSet.toString());
    if (progress <= c1/circumference){ // 落在第1部分
      // _paint.shader = sweep.createShader(rectLeftTop);
      // canvas.drawArc(rectLeftTop, -pi , pi / 2  * (circumference/c1) * progress, false, _paint);
      canvas.drawArc(rectLeftTop, -pi , pi / 2  * (circumference/c1) * progress, false, _paint1);
    } else if (progress > c1/circumference && progress <= c2/circumference){ // 落在第2部分
      progressTemp = progress - c1/circumference;
      print("Now progressTemp is " + progressTemp.toString());
      canvas.drawArc(rectLeftTop, -pi , pi / 2, false, _paint1);
      // _paint.shader = line.createShader(rectLeftTop);
      canvas.drawLine(Offset(radius + offSet,offSet), Offset(radius + (11*radius - offSet - radius) * (circumference/(c2-c1)) * progressTemp, offSet), _paint1);//【2】
    } else if (progress > c2/circumference && progress <= c3/circumference){ // 落在第3部分
      progressTemp = progress - c2/circumference;
      canvas.drawArc(rectLeftTop, -pi , pi / 2, false, _paint1);
      canvas.drawLine(Offset(radius + offSet,offSet), Offset(11*radius - offSet, offSet), _paint1);
      canvas.drawArc(rectRightTop, -pi/2, pi/2 *(circumference/(c3-c2)) * progressTemp, false, _paint1); // -先回退-90°再开始转90°【3】
    } else if (progress > c3/circumference && progress <= c4/circumference){ // 落在第4部分
      progressTemp = progress - c3/circumference;
      canvas.drawArc(rectLeftTop, -pi , pi / 2, false, _paint1);
      canvas.drawLine(Offset(radius + offSet,offSet), Offset(11*radius - offSet, offSet), _paint1);
      canvas.drawArc(rectRightTop, -pi/2, pi/2, false, _paint1);
      canvas.drawLine(Offset(size.width-offSet,radius+offSet), Offset(size.width-offSet,(radius+offSet) + (5*radius-offSet-(radius+offSet)) *((circumference)/(c4 - c3)) * progressTemp), _paint1);//【4】
    } else if (progress > c4/circumference && progress <= c5/circumference){ // 落在第5部分
      progressTemp = progress - c4/circumference;
      canvas.drawArc(rectLeftTop, -pi , pi / 2, false, _paint1);
      canvas.drawLine(Offset(radius + offSet,offSet), Offset(11*radius - offSet, offSet), _paint1);
      canvas.drawArc(rectRightTop, -pi/2, pi/2, false, _paint1);
      canvas.drawLine(Offset(size.width-offSet,radius+offSet), Offset(size.width-offSet,5*radius-offSet), _paint1);
      canvas.drawArc(rectRightBottom, 0, pi/2 *(circumference/(c5-c4)) * progressTemp, false, _paint1); // 先回退0°再开始转90°【5】
    } else if (progress > c5/circumference && progress <= c6/circumference){ // 落在第6部分
      progressTemp = progress - c5/circumference;
      canvas.drawArc(rectLeftTop, -pi , pi / 2, false, _paint1);
      canvas.drawLine(Offset(radius + offSet,offSet), Offset(11*radius - offSet, offSet), _paint1);
      canvas.drawArc(rectRightTop, -pi/2, pi/2, false, _paint1);
      canvas.drawLine(Offset(size.width-offSet,radius+offSet), Offset(size.width-offSet,5*radius-offSet), _paint1);
      canvas.drawArc(rectRightBottom, 0, pi/2, false, _paint1);
      canvas.drawLine(Offset(11*radius-offSet,size.width/2-offSet), Offset((11*radius-offSet) - ((11*radius-offSet) - (radius + offSet)) *(circumference/(c6 - c5)) * progressTemp,size.width/2-offSet), _paint1);//【6】
    } else if (progress > c6/circumference && progress <= c7/circumference){ // 落在第7部分
      progressTemp = progress - c6/circumference;
      canvas.drawArc(rectLeftTop, -pi , pi / 2, false, _paint1);
      canvas.drawLine(Offset(radius + offSet,offSet), Offset(11*radius - offSet, offSet), _paint1);
      canvas.drawArc(rectRightTop, -pi/2, pi/2, false, _paint1);
      canvas.drawLine(Offset(size.width-offSet,radius+offSet), Offset(size.width-offSet,5*radius-offSet), _paint1);
      canvas.drawArc(rectRightBottom, 0, pi/2, false, _paint1);
      canvas.drawLine(Offset(radius + offSet,size.width/2-offSet), Offset(11*radius-offSet,size.width/2-offSet), _paint1);
      canvas.drawArc(rectLeftBottom, pi/2, pi/2 *(circumference/(c7 - c6)) * progressTemp, false, _paint1); // 先前进90°再开始转90°【7】
    } else {  // 落在最后部分
      progressTemp = progress - c7/circumference;
      canvas.drawArc(rectLeftTop, -pi , pi / 2, false, _paint1);
      canvas.drawLine(Offset(radius + offSet,offSet), Offset(11*radius - offSet, offSet), _paint1);
      canvas.drawArc(rectRightTop, -pi/2, pi/2, false, _paint1);
      canvas.drawLine(Offset(size.width-offSet,radius+offSet), Offset(size.width-offSet,5*radius-offSet), _paint1);
      canvas.drawArc(rectRightBottom, 0, pi/2, false, _paint1);
      canvas.drawLine(Offset(radius + offSet,size.width/2-offSet), Offset(11*radius-offSet,size.width/2-offSet), _paint1);
      canvas.drawArc(rectLeftBottom, pi/2, pi/2, false, _paint1);
      canvas.drawLine(Offset(offSet,5*radius-offSet), Offset(offSet,(5*radius-offSet) - ((5*radius-offSet) - (radius+offSet)) *(circumference/(circumference - c7)) * progressTemp), _paint1);//【8】
    }
    hasInit = true;
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}