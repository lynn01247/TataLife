import 'package:ele_progress/ele_progress.dart';
import 'package:ele_theme/ele_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Models/global_value.dart';
import 'package:todo_app/Widgets/HomePage/Grettings/clock_page.dart';
import 'package:typewritertext/typewritertext.dart';

class Greetings extends StatelessWidget {
  Greetings({Key? key, required this.customFontSize, required this.vType}) : super(key: key);
  double customFontSize;
  num vType;

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = true; // 显示边界布局
    int num = 1;
    String content = Global.dayWordList[num];
    return Column(
      children: [
        (vType == 1) ? (SizedBox(height: MediaQuery.of(context).size.height / 18,)) : const SizedBox(),
        (vType == 1)
            ? (SizedBox(width: MediaQuery.of(context).size.width,//width很重要，不设置宽度的话内容会不显示，Row要知道父Widget宽度
                child: Row( //使用Row+Expanded包裹Text文本就会自适应高度
                  children: const [
                    Padding(padding: EdgeInsets.only(left: 15.0),
                      child: Expanded(child: Text("清风心语：", style: TextStyle(fontSize: 12),),),
                    )
                  ],
                ),
              )) : const SizedBox(),
        (vType == 1) ? (Padding(padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 30.0),
                child: SizedBox(width: MediaQuery.of(context).size.width,//width很重要，不设置宽度的话内容会不显示，Row要知道父Widget宽度
                  child: Row( //使用Row+Expanded包裹Text文本就会自适应高度
                    children: [Expanded(
                        child: TypeWriterText(
                          text: Text(content, style: const TextStyle(fontSize: 13, color: Colors.grey,),),
                          duration: const Duration(milliseconds: 100),
                        ),
                      ),
                      // Expanded(child: Text(content, style: const TextStyle(fontSize: 13, color: Colors.grey,),),),
                    ],
                  ),
                ),
              )) : const SizedBox(),
        (vType == 2) ? (SizedBox(width: MediaQuery.of(context).size.width,//width很重要，不设置宽度的话内容会不显示，Row要知道父Widget宽度
                child: Row( //使用Row+Expanded包裹Text文本就会自适应高度
                  children: const [Padding(
                      padding: EdgeInsets.only(left: 15.0, top: 10.0),
                      child: Expanded(child: Text("生命倒计时：", style: TextStyle(fontSize: 12),),),
                    )
                  ],
                ),
              )) : const SizedBox(),
        (vType == 2) ? (Container(
                height: MediaQuery.of(context).size.width / 2, // 180.0
                width: MediaQuery.of(context).size.width / 2,
                color: HexColor('#f9f6e8'),
                child:
                  // Clock(MediaQuery.of(context).size.width / 2),
                  EProgress(
                    type: ProgressType.liquid,
                    status: EleThemeStatus.warning,
                    progress: 80,
                    textStyle:const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    direction: Axis.vertical,
                    format: (progress) {return '     生命已流失：$progress%\n 3600天/7200天[94岁]';},
                    radius: 300,
                    backgroundColor: Colors.grey,
                    colors: [
                      Colors.greenAccent.shade200,
                      Colors.redAccent.shade100,
                      Colors.pinkAccent.shade200,
                      Colors.redAccent,
                    ],
                  ),
              )) : const SizedBox(),
      ],
    );
  }
}
