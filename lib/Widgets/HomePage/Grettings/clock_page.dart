import 'dart:async';

import 'package:ele_theme/ele_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:ele_progress/ele_progress.dart';
import 'package:todo_app/Widgets/HomePage/Grettings/CustomCircleProgress.dart';

double maxWidth = 0.0;
double maxHeight = 0.0;
class Clock extends StatefulWidget {
  Clock(double width, {Key? key}) : super(key: key) {
    maxWidth = width;
    maxHeight = width / 2;
  }

  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  late Timer _timer;
  late DateTime dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), setTime);
  }

  void setTime(Timer timer) {
    setState(() {
      dateTime = DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: HexColor('#f9f6e8'), child: Center(child: ClockWidget(dateTime: dateTime,))));
  }
}

class ClockWidget extends StatelessWidget {
  final DateTime dateTime;

  const ClockWidget({Key? key, required this.dateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var seconds = dateTime.second.toDouble();
    var minutes = dateTime.minute.toDouble();
    var hours = dateTime.hour.toDouble();
    var months = dateTime.month.toDouble();
    var years = dateTime.year.toDouble();
    // return CustomCircleProgress(maxWidth, 0.8);
      // Padding(padding: const EdgeInsets.all(10.0),
      // child: CustomCircleProgress(maxWidth, 0.8)); // maxProgress不能大于1
    // return Container(
    //     height: 100.0, // 180.0
    //     width: 200.0, color: HexColor('#f9f6e8'),
    //     child:
    //       EProgress(
    //       type: ProgressType.liquid,
    //       progress: 80,
    //       radius: 30,
    //       backgroundColor: Colors.grey,
    //       colors: [Colors.redAccent,],
    //     ),
    //   );
    return SleekCircularSlider(// 秒针的圆环
      appearance: secAppearance,
      min: 0, max: 59, initialValue: seconds,
      innerWidget: (double value) {
        return Align(alignment: Alignment.center,
          child: SleekCircularSlider(// 分针的圆环
            appearance: minAppearance,
            min: 0, max: 59, initialValue: minutes,
            innerWidget: (double value) {
              return Align(alignment: Alignment.center,
                child: SleekCircularSlider(// 时针的圆环
                  appearance: hourAppearance,
                  min: 0, max: 24, initialValue: hours,
                  innerWidget: (double value) {
                    return Align(alignment: Alignment.center,
                      child: SleekCircularSlider(// 月针的圆环
                        appearance: monAppearance,
                        min: 0, max: 11, initialValue: months,
                        innerWidget: (double value) {
                          return Align(alignment: Alignment.center,
                            child: SleekCircularSlider(// 年针的圆环
                              appearance: yearAppearance,
                              min: 0, max: 90, initialValue: 20,
                              innerWidget: (double value) {
                                final y = years.toInt();
                                final mon = months.toInt() < 10 ? '0${months.toInt()}' : months.toInt().toString();
                                final h = hours.toInt() < 10 ? '0${hours.toInt()}' : hours.toInt().toString();
                                final min = minutes.toInt() < 10 ? '0${minutes.toInt()}' : minutes.toInt().toString();
                                final s = seconds.toInt() < 10 ? '0${seconds.toInt()}' : seconds.toInt().toString();
                                return Center(child: Text(
                                  '$y $mon :$h : $min : $s',
                                  style: TextStyle(color: HexColor('#A177B0'), fontSize: 15, fontWeight: FontWeight.w400),
                                ));
                              },
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}

final customWidth01 = CustomSliderWidths(
    trackWidth: 3, progressBarWidth: 3, shadowWidth: 0); // 2:10:20
final customColors01 = CustomSliderColors(
    dotColor: Colors.white.withOpacity(0.8),
    trackColor: HexColor('#FFD4BE').withOpacity(0.4),
    progressBarColor: HexColor('#F6A881'),
    shadowColor: HexColor('#FFD4BE'),
    shadowStep: 2.0, // 10
    shadowMaxOpacity: 0.6);

// 秒针
final CircularSliderAppearance secAppearance = CircularSliderAppearance(
    customWidths: customWidth01,
    customColors: customColors01,
    startAngle: 270,
    angleRange: 360,
    size: maxHeight,
    animationEnabled: false);

final customWidth02 = CustomSliderWidths(
    trackWidth: 2, progressBarWidth: 2, shadowWidth: 0); // 5:15:30
final customColors02 = CustomSliderColors(
    dotColor: Colors.white.withOpacity(0.8),
    trackColor: HexColor('#98DBFC').withOpacity(0.3),
    progressBarColor: HexColor('#6DCFFF'),
    shadowColor: HexColor('#98DBFC'),
    shadowStep: 2.0, // 15
    shadowMaxOpacity: 0.3);

// 分针
final CircularSliderAppearance minAppearance = CircularSliderAppearance(
    customWidths: customWidth02,
    customColors: customColors02,
    startAngle: 270,
    angleRange: 360,
    size: (maxHeight - 30.0), // 290.0
    animationEnabled: false);

final customWidth03 = CustomSliderWidths(
    trackWidth: 2, progressBarWidth: 2, shadowWidth: 0); // 8:20:40
final customColors03 = CustomSliderColors(
    dotColor: Colors.white.withOpacity(0.8),
    trackColor: HexColor('#EFC8FC').withOpacity(0.3),
    progressBarColor: HexColor('#A177B0'),
    shadowColor: HexColor('#EFC8FC'),
    shadowStep: 2.0, // 20
    shadowMaxOpacity: 0.3);

// 时针
final CircularSliderAppearance hourAppearance = CircularSliderAppearance(
    customWidths: customWidth03,
    customColors: customColors03,
    startAngle: 270,
    angleRange: 360,
    size: (maxHeight - 60.0), // 210.0
    animationEnabled: false);

final customWidth04 = CustomSliderWidths(
    trackWidth: 2, progressBarWidth: 2, shadowWidth: 0); // 8:20:40
final customColors04 = CustomSliderColors(
    dotColor: Colors.white.withOpacity(0.8),
    trackColor: HexColor('#EFC8FC').withOpacity(0.3),
    progressBarColor: HexColor('#A177B0'),
    shadowColor: HexColor('#EFC8FC'),
    shadowStep: 2.0, // 20
    shadowMaxOpacity: 0.3);

// 月针
final CircularSliderAppearance monAppearance = CircularSliderAppearance(
    customWidths: customWidth04,
    customColors: customColors04,
    startAngle: 270,
    angleRange: 360,
    size: (maxHeight - 90.0), // 210.0
    animationEnabled: false);

final customWidth05 = CustomSliderWidths(
    trackWidth: 2, progressBarWidth: 2, shadowWidth: 0); // 8:20:40
final customColors05 = CustomSliderColors(
    dotColor: Colors.white.withOpacity(0.8),
    trackColor: HexColor('#EFC8FC').withOpacity(0.3),
    progressBarColor: HexColor('#A177B0'),
    shadowColor: HexColor('#EFC8FC'),
    shadowStep: 2.0, // 20
    shadowMaxOpacity: 0.3);

// 时针
final CircularSliderAppearance yearAppearance = CircularSliderAppearance(
    customWidths: customWidth05,
    customColors: customColors05,
    startAngle: 270,
    angleRange: 360,
    size: (maxHeight - 120.0), // 210.0
    animationEnabled: false);