import 'package:ele_theme/ele_theme.dart';
import 'package:ele_theme/ele_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/global_value.dart';
import 'package:todo_app/Widgets/HomePage/Grettings/greetings.dart';
import 'package:todo_app/Widgets/HomePage/Grettings/timeline.dart';
import 'package:todo_app/Widgets/HomePage/Info/info_widget.dart';
import 'package:todo_app/Widgets/HomePage/Tasks/task_info.dart';
import 'package:todo_app/Widgets/Todo/todo_list.dart';
import 'package:timelines/timelines.dart';
import 'package:todo_app/provider/todos_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int badgeValue;

  @override
  void initState() {
    super.initState();
    // App icon badge
    badgeValue = Provider.of<TodosProvider>(context, listen: false).unCompletedTodos.where((Todo) {
      return DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds).day == DateTime.now().day
          && DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds).month == DateTime.now().month
          && DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds).year == DateTime.now().year;
    }).length;
    FlutterAppBadger.updateBadgeCount(badgeValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#f9f6e8'),
        body: const TimelineStatusPage(),
      // body: CustomScrollView(
      //   physics: const BouncingScrollPhysics(),
      //   slivers: <Widget>[
      //     SliverPadding(
      //       padding: const EdgeInsets.only(bottom: 1),
      //       sliver: SliverToBoxAdapter(
      //         child:_topWidget(context),
      //       ),
      //     ),
      //     const SliverPadding(
      //       padding: EdgeInsets.only(left: 10.0, right: 10.0,bottom: 2),
      //       sliver: SliverToBoxAdapter(
      //         child: _Timeline(),
      //       ),
      //     )
      //   ],
      // )
    );
  }

  Widget _topWidget(BuildContext context){
    return LayoutBuilder(builder: (context, constraints) {
      return Column(children: [// vBody==1：顶部模块；2：生命倒计时模块     vType==1：跑道模型； 其他：水波模型；
        // 顶部清风心语模块
        constraints.maxWidth < 350 ? Greetings(customFontSize: 25, vBody: 1,) : Greetings(customFontSize: 30, vBody: 1,),
        // 个人进度模块
        constraints.maxWidth < 350 ? InfoWidget(height: 7.4, width: 1.1, customFontSize: 13,)
        // For iphone 11 - height 812  || iphone 13 pro - height 760
            : constraints.maxHeight == 812 || constraints.maxHeight == 760 ? InfoWidget(height: 11, width: 1.1, customFontSize: 18)
        // For iphone 11 pro, 13 mini, iphone xs - height 728
            : constraints.maxHeight == 728 ? InfoWidget(height: 10.6, width: 1.1, customFontSize: 18)
        // For iphone 8,7,iphone se  - height 617
            : constraints.maxHeight == 617 ? InfoWidget(height: 8.5, width: 1.1, customFontSize: 18)
        // iphone 13 Pro max - 842
            : constraints.maxHeight == 842 ? InfoWidget(height: 11.2, width: 1.1, customFontSize: 18)
        // else
            : constraints.maxHeight == 686 ? InfoWidget(height: 9.4, width: 1.1, customFontSize: 18) : InfoWidget(height: 8, width: 1.1, customFontSize: 18),
        // 生命倒计时模块
        constraints.maxWidth < 350 ? Greetings(customFontSize: 25, vBody: 2, vType: 1) : Greetings(customFontSize: 30,vBody: 2, vType: 1),
        const TaskInfo(),
        // const Expanded(child: TodoWidget()),
      ],);
    });
  }
}