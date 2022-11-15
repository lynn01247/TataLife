import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// External Libs
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';
import 'package:todo_app/translations/locale_keys.g.dart';

class InfoWidget extends StatelessWidget {
  InfoWidget({Key? key, required this.height, required this.width, required this.customFontSize}) : super(key: key);
  double width;
  double height;
  double customFontSize;

  Widget _circularProgressBar(double percent) {
    return CircularPercentIndicator(
      radius: 48.0,
      lineWidth: 6.0,
      animation: true,
      percent: percent.isNaN ? 0 : percent,
      center: Text(
        percent.isNaN ? '${((percent = 0) * 100).round()}%' : '${(percent * 100).round()}%',
        style: const TextStyle(color: Colors.white, fontSize: 10),
      ),
      backgroundColor: Colors.white,
      progressColor: Colors.orangeAccent,
    );
  }

  @override
  Widget build(BuildContext context) {
    double percent = Provider.of<TodosProvider>(context).calcTodoPercent(DateTime.now());
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(alignment: Alignment.bottomRight,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / width,
              height: MediaQuery.of(context).size.height / height,
              decoration: BoxDecoration(color: HexColor('#ff9d73'), borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(top: 14, bottom: 12, left: 24),
                child: Row(
                  children: [
                    Column(children: [_circularProgressBar(percent),]),
                    Padding(
                      padding: const EdgeInsets.only(left: 14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Consumer<TodosProvider>(
                              builder: (context, state, child) {
                            return AutoSizeText(
                              percent.isNaN ? '难得悠闲 ' + (state.name) : (percent == 1) ? '做的不错 ' + (state.name):'加油哦 ' + (state.name),
                              maxLines: 2,
                              style: TextStyle(color: Colors.white, fontSize: customFontSize, fontWeight: FontWeight.bold),
                            );
                          }),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: Text(
                              percent.isNaN ? '今天没有任务哦，可以咸鱼一天！' : (percent == 1) ? '耶！今天任务已经全部完成啦！':'今天还有任务未完成，继续努力！',
                              style: const TextStyle(color: Colors.white, fontSize: 12,),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
