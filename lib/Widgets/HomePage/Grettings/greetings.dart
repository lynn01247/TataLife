import 'package:ele_progress/ele_progress.dart';
import 'package:ele_theme/ele_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/Models/global_value.dart';
import 'package:todo_app/Widgets/HomePage/Grettings/circle_page.dart';
import 'package:todo_app/Widgets/HomePage/Grettings/clock_page.dart';
import 'package:typewritertext/typewritertext.dart';

class Greetings extends StatelessWidget {
  Greetings({Key? key, required this.customFontSize, required this.vBody, num? vType}) : super(key: key){
    type = vType;
  }
  double customFontSize;
  num vBody;// body==1：顶部模块； 2：生命倒计时模块
  num? type;// type==1：跑道模型； 2：水波模型

  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true; // 显示边界布局
    int num = 1; // 支持变换
    String content = Global.dayWordList[num];
    return Column(children: [
        (vBody == 1) ? (SizedBox(height: MediaQuery.of(context).size.height / 18,)) : const SizedBox(),
        (vBody == 1) ? (SizedBox(width: MediaQuery.of(context).size.width,//width很重要，不设置宽度的话内容会不显示，Row要知道父Widget宽度
                child: Row( //使用Row+Expanded包裹Text文本就会自适应高度
                  children: const [Padding(padding: EdgeInsets.only(left: 15.0), child: Expanded(child: Text("清风心语：", style: TextStyle(fontSize: 12),),),)],),)) : const SizedBox(),
        (vBody == 1) ? (Padding(padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 30.0),
                child: SizedBox(width: MediaQuery.of(context).size.width,//width很重要，不设置宽度的话内容会不显示，Row要知道父Widget宽度
                  child: Row( //使用Row+Expanded包裹Text文本就会自适应高度
                    children: [Expanded(child: TypeWriterText(text: Text(content, style: const TextStyle(fontSize: 13, color: Colors.grey,),), 
                      duration: const Duration(milliseconds: 100),),),],),),)) : const SizedBox(),
        (vBody == 2) ? (SizedBox(width: MediaQuery.of(context).size.width,//width很重要，不设置宽度的话内容会不显示，Row要知道父Widget宽度
                child: Row( //使用Row+Expanded包裹Text文本就会自适应高度
                  children: const [Padding(padding: EdgeInsets.only(left: 15.0, top: 10.0), child: Expanded(child: Text("生命倒计时：", style: TextStyle(fontSize: 12),),),)],),)) : const SizedBox(),
        (vBody == 2) ? (
                (type != null && type == 1 ) ?
                Container(
                    // 跑道模型
                    height: MediaQuery.of(context).size.width / 2, // 180.0
                    width: MediaQuery.of(context).size.width,
                    color: HexColor('#f9f6e8'),
                    child: Stack(
                      alignment : Alignment.center, // 使用属性的形式
                      children: <Widget>[
                        // Container(
                        //   height: MediaQuery.of(context).size.height,
                        //   width: MediaQuery.of(context).size.width,
                        // ),
                        CircleProgress(MediaQuery.of(context).size.width),
                        // Clock(MediaQuery.of(context).size.width),
                      ],
                    ))
                : Container( // 默认水波模型【0或者空】
                    height: MediaQuery.of(context).size.width / 2, // 宽高一致
                    width: MediaQuery.of(context).size.width / 2,  // 宽高一致
                    color: HexColor('#f9f6e8'),
                    child: EProgress(type: ProgressType.liquid, status: EleThemeStatus.warning, progress: 80,direction: Axis.vertical,
                      textStyle:const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),radius: 300, backgroundColor: Colors.grey,
                      format: (progress) {return '     生命已流失：$progress%\n 3600天/7200天[94岁]';},
                      colors: [Colors.greenAccent.shade200, Colors.redAccent.shade100, Colors.pinkAccent.shade200, Colors.redAccent,],),)
               ) : const SizedBox(),

      ],
    );
  }
}
