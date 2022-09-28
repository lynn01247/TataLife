import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/global_value.dart';
import 'package:todo_app/provider/todos_provider.dart';

class LifeExamPage extends StatefulWidget {
  const LifeExamPage({Key? key}) : super(key: key);

  @override
  _LifeExamPageState createState() => _LifeExamPageState();
}

class _LifeExamPageState extends State<LifeExamPage> {
  late ScrollController _scrollController;
  late BuildContext mContext;

  @override
  void initState() {
    super.initState();
    Provider.of<TodosProvider>(context, listen: false).initSharedPreferences();
    // var name = TodosProvider().getName();
    // var score = TodosProvider().getScore();
    // print("main_screen " + score.toString());
    // var surName = TodosProvider().getSurname();
    // var gender = TodosProvider().getGender();
    // print("LifeExamPageState name: "+ name + ",surName: " + surName+ ",gender: " + gender.toString());
    if (TodosProvider().getScore() == Global.defaultScore) {
      Global.itemChoiceList.clear();
      Global.itemChoiceScoreList.clear();
    }
    _scrollController = ScrollController()..addListener(() {});
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true ;// 显示边界布局
    mContext = context;
    return _examMainView(0);
  }

  Widget _examMainView(int value){
    return Scaffold(
        appBar: AppBar(
          title: const Text("答题测试"),
          // title: Text("答题测试 " + Global.itemChoiceList.length.toString() + "/" + Global.examList.length.toString()),
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.account_balance), onPressed: () {
              _onTapShowDialog(context, "温馨提示", "你还未答完全部题目，是否确定要跳过此次答题，直接进入主页吗？", OnDialogClickListener(
                  onConfirm: (){
                    Global.itemChoiceList.clear();
                    Global.itemChoiceScoreList.clear();
                    finishExam();
                  },
                  onCancel: (){}
              ));
            }),
          ],
        ),
        body: _buildCustomScrollView(value));
  }

  CustomScrollView _buildCustomScrollView(int i) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      controller: _scrollController,

      ///反弹效果
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate((content, index) {
            return Container(
              alignment: Alignment.center,
              // color: Colors.primaries[index % Colors.primaries.length],
              child: _examBodyView(i),
            );
          }, childCount: 1),
        )
      ],
    );
  }

  var examWarning = "";

  Widget _examBodyView(int i) {
    //0:1-10  1:11-20  2:21-30  3:31-40
    return Column(
      children: [
        _examContent(i * 10 + 1, Global.examList[i * 10 + 0], mContext),
        _examContent(i * 10 + 2, Global.examList[i * 10 + 1], mContext),
        _examContent(i * 10 + 3, Global.examList[i * 10 + 2], mContext),
        _examContent(i * 10 + 4, Global.examList[i * 10 + 3], mContext),
        _examContent(i * 10 + 5, Global.examList[i * 10 + 4], mContext),
        _examContent(i * 10 + 6, Global.examList[i * 10 + 5], mContext),
        _examContent(i * 10 + 7, Global.examList[i * 10 + 6], mContext),
        _examContent(i * 10 + 8, Global.examList[i * 10 + 7], mContext),
        _examContent(i * 10 + 9, Global.examList[i * 10 + 8], mContext),
        _examContent(i * 10 + 10, Global.examList[i * 10 + 9], mContext),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          (i >= 1 && i <= 3) ? ElevatedButton(onPressed: () {Navigator.of(mContext).pop();}, child: const Text('上一页'),) : const SizedBox(),
          const SizedBox(width: 10,),
          (i >= 0 && i <= 2) ? ElevatedButton(
            onPressed: () {
              isAllChecked(i) ? Navigator.push(mContext,
                  PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 500),
                        //动画执行时间为500毫秒
                        pageBuilder: (BuildContext context, Animation<double> animation, Animation secondaryAnimation) {
                          return FadeTransition(opacity: animation, child: _examMainView(i + 1),);
                        })) : Fluttertoast.showToast(msg: examWarning);
            },
            child: const Text('下一页'),) : ((i == 3) ?
          ElevatedButton(
            onPressed: () {
              double score = TodosProvider().getGender() == 1 ? 86 : 89;  // 本计算方法的基础是：男性的预期寿命设定为86岁，女性则为89岁
              for(double i in Global.itemChoiceScoreList){
                  score = score + i;
              }
              TodosProvider().saveScore(score);
              isAllChecked(i) ? finishExam() : Fluttertoast.showToast(msg: examWarning);
            },
            child: const Text('完成'),
          ): const SizedBox()),
          const SizedBox(width: 10,)
        ])
      ],
    );
  }

  isAllChecked(int i) {
    if (Global.itemChoiceList.length == (i + 1) * 10) {
      return true;
    } else {
      for (int j = 0; j < (i + 1) * 10; j++) {
        int v = j + 1;
        if (!Global.itemChoiceList.contains("$v") && !Global.itemChoiceList.contains("-$v")) {
          examWarning = "第$v道题还未选择哦 ^_ ^";
          break;
        }
      }
      return false;
    }
  }

  finishExam() {
    Navigator.of(context).popAndPushNamed('/MainScreen');
  }
}

///封装的每道题的控件
SizedBox _examContent(int index, String content, BuildContext mContext) {
  return SizedBox(
    child: Container(
      color: Colors.primaries[index % Colors.primaries.length],
      width: MediaQuery.of(mContext).size.width,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 2),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("$index、" + content.split("。")[0], softWrap: true, style: const TextStyle(fontSize: 16, color: Colors.black),),
        const SizedBox(height: 35),
        ItemChoice(index, content.split("。")[1], content.split("。")[2]),
      ]),
    ),
  );
}

///封装的选项选择控件
class ItemChoice extends StatefulWidget {
  int index = -1;
  late String yesItem;
  late String noItem;

  ItemChoice(int i, String y, String n, {Key? key}) : super(key: key) {
    index = i;
    yesItem = y;
    noItem = n;
  }

  @override
  State<StatefulWidget> createState() =>
      _ItemChoiceState(index, yesItem, noItem);
}

_onTapShowDialog(BuildContext context, String title, String msg, OnDialogClickListener listener) {
  showDialog(context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            ElevatedButton(onPressed: () {
              Navigator.of(context).pop(false);
              listener.onCancel();
            }, child: const Text('取消')),
            ElevatedButton(onPressed: () {
              Navigator.of(context).pop(true);
              listener.onConfirm();
            }, child: const Text('确认')),
          ],
        );
      });
}

typedef OnConfirm = void Function();
typedef OnCancel = void Function();

class OnDialogClickListener {
  OnConfirm onConfirm;
  OnCancel onCancel;
  OnDialogClickListener ({required this.onConfirm,  required this.onCancel});
}

typedef OnSuccess = void Function(Object o);
typedef OnError = void Function(Exception e);

///封装的选项选择控件-state
class _ItemChoiceState extends State<ItemChoice> {
  bool _yesValue = false;
  bool _noValue = false;
  int _index = -1;
  String _yesItem = '    是    ';
  String _noItem = '    否    ';

  _ItemChoiceState(int i, String y, String n) {
    _index = i;
    _yesItem = y;
    _noItem = n;
  }

  @override
  Widget build(BuildContext context) {
    var _itemIndex = _index;
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      RawChip(
        padding: const EdgeInsets.fromLTRB(15, 1, 15, 1),
        // checkmarkColor: Colors.red,
        label: Text(_yesItem.split("！")[0], style: const TextStyle(fontSize: 13, color: Colors.black)),
        selected: _yesValue,
        onSelected: (v) {
          v ? Global.itemChoiceList.add(_itemIndex.toString()) : Global.itemChoiceList.remove(_itemIndex.toString());
          v ? Global.itemChoiceScoreList.add(double.parse(_yesItem.split("！")[1])) : Global.itemChoiceScoreList.remove(double.parse(_yesItem.split("！")[1]));
          setState(() {
            if (v) {
              _noValue = !v;
            } else {}
            _yesValue = v;
          });
        },
        selectedColor: Colors.lightBlue,
        selectedShadowColor: Colors.red,
        showCheckmark: true,
        //勾选状态
        pressElevation: 12, //点击效果
      ),
      const SizedBox(width: 10),
      RawChip(
        padding: const EdgeInsets.fromLTRB(15, 1, 15, 1),
        label: Text(_noItem.split("！")[0], style: const TextStyle(fontSize: 13, color: Colors.black)),
        selected: _noValue,
        onSelected: (v) {
          v ? Global.itemChoiceList.add("-$_itemIndex") : Global.itemChoiceList.remove("-$_itemIndex");
          v ? Global.itemChoiceScoreList.add(double.parse(_noItem.split("！")[1])) : Global.itemChoiceScoreList.remove(double.parse(_noItem.split("！")[1]));
          setState(() {
            if (v) {
              _yesValue = !v;
            }
            _noValue = v;
          });
        },
        selectedColor: Colors.lightBlue,
        selectedShadowColor: Colors.red,
        showCheckmark: true,
        //勾选状态
        pressElevation: 12, //点击效果
      ),
    ]);
  }
}
