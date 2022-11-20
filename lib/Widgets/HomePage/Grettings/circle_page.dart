import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Widgets/HomePage/Grettings/CustomCircleProgress.dart';

double maxWidth = 0.0;

class CircleProgress extends StatefulWidget {
  CircleProgress(double width, {Key? key}) : super(key: key) {
    maxWidth = width;
  }

  _CircleProgressState createState() => _CircleProgressState();
}

class _CircleProgressState extends State<CircleProgress> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: HexColor('#f9f6e8'),
            child: const Center(child: _CircleProgressWidget())));
  }
}

class _CircleProgressWidget extends StatelessWidget {
  const _CircleProgressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCircleProgress(viewWidth: maxWidth, progress: 0.8, strokeWidth: 10.0,);
  }
}
