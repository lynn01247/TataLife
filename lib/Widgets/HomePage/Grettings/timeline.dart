import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:todo_app/Models/global_value.dart';

class TimelineStatusPage extends StatelessWidget {
  const TimelineStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: TitleAppBar('Timeline Status'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              _Timeline1(),
              const SizedBox(width: 12.0),
            ],
          ),
        ),
      ),
    );
  }
}

class _Timeline1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var data = Global.listData;
    return Flexible(
      child: Timeline.tileBuilder(
        theme: TimelineThemeData(
          nodePosition: 0,
          connectorTheme: const ConnectorThemeData(
            thickness: 3.0,
            // space:4.0,
            indent: 5.0,
            color: Color(0xffd3d3d3),
          ),
          indicatorTheme: const IndicatorThemeData(
            size: 15.0,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        builder: TimelineTileBuilder.connected(
          contentsBuilder: (_, __) => _EmptyContents(),
          connectorBuilder: (_, index, __) {
            if (index == 0) {
              return const SolidLineConnector(color: Color(0xff6ad192));
            } else {
              return const SolidLineConnector();
            }
          },
          indicatorBuilder: (_, index) {
            switch (data[index]) {
              case _TimelineStatus.done:
                return const DotIndicator(
                  color: Color(0xff6ad192),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 10.0,
                  ),
                );
              case _TimelineStatus.sync:
                return const DotIndicator(
                  color: Color(0xff193fcc),
                  child: Icon(
                    Icons.sync,
                    size: 10.0,
                    color: Colors.white,
                  ),
                );
              case _TimelineStatus.inProgress:
                return const OutlinedDotIndicator(
                  color: Color(0xffa7842a),
                  borderWidth: 2.0,
                  backgroundColor: Color(0xffebcb62),
                );
              case _TimelineStatus.todo:
              default:
                return const OutlinedDotIndicator(
                  color: Color(0xffbabdc0),
                  backgroundColor: Color(0xffe6e7e9),
                );
            }
          },
          itemExtentBuilder: (_, __) => getHeight(__),
          itemCount: data.length,
        ),
      ),
    );
  }
}
double getHeight(int index){
  if(index == 1){
    return 250.0;
  }else{
    return 200.0;
  }
}
enum _TimelineStatus {
  done,
  sync,
  inProgress,
  todo,
}

class _EmptyContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.only(left: 10.0),
      // height: 50.0,
      child: Expanded(
          child: Padding(
              padding: EdgeInsets.only(left: 0, right: 15),
              child: Text("备注：降价1000客户可考虑，辛苦再撮合11111备注：的啊发发发发，辛苦再撮合范德萨发的备注：降价佛挡杀佛1000客户可考虑，辛苦再撮合\n"
                  "注：降价1000客户可考虑，辛苦再撮合11111备注：的啊发发发发，辛苦再撮合范德萨发的备注：降价佛挡杀佛1000客户可考虑，辛苦再撮合"))),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        color: const Color(0xffe6e7e9),
      ),
    );
  }
}
