import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Models/GlobalValue.dart';
import 'package:todo_app/Pages/fade_route.dart';

class MyCustomAmniatonPageA extends StatefulWidget {
  const MyCustomAmniatonPageA({Key? key}) : super(key: key);

  @override
  _MyCustomAmniatonPageAState createState() => _MyCustomAmniatonPageAState();
}

class _MyCustomAmniatonPageAState extends State<MyCustomAmniatonPageA> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getAppBar('答题测试'),
        body: Column(
          children: [
            _testContent(1,"content", false, false),
            _testContent(2,"content", false, false),
            Container(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 500),
                          //动画执行时间为500毫秒
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation secondaryAnimation) {
                            return FadeTransition(
                              opacity: animation,
                              child: const MyCustomAmniatonPageB(),
                            );
                          }));
                },
                child: Text('自定义转场动画渐变效果'),
              ),
            ),

            // ElevatedButton(onPressed: (){
            //   Navigator.push(context, FadeRoute(builder: (context) {
            //     return MyCustomAmniatonPageB();
            //   }));
            //
            //
            // },child: const Text('自定义PageRoute转场动画渐变效果'),),
          ],
        ));
  }
}

class MyCustomAmniatonPageB extends StatefulWidget {
  const MyCustomAmniatonPageB({Key? key}) : super(key: key);

  @override
  _MyCustomAmniatonPageBState createState() => _MyCustomAmniatonPageBState();
}

class _MyCustomAmniatonPageBState extends State<MyCustomAmniatonPageB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('自定义导航跳转动画B'),
    );
  }
}

AppBar getAppBar(String title) {
  return AppBar(
    title: Text(title),
  );
}

SizedBox _testContent(int index, String content, bool yes, bool no) {
  return SizedBox(
    height: 200,
    child: Container(
      color: Colors.red,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$index、这是一长段文字'),
            Column(
                mainAxisAlignment: MainAxisAlignment.center, children: [
              Switch('    是    ', index),
              Switch('    否    ', index),
            ]),
          ]),
    ),
  );
}

class Switch extends StatefulWidget {
  int index = -1;
  String content = "";
  Switch(String c, int i, {Key? key}) : super(key: key){
    content = c;
    index = i;
  }

  @override
  State<StatefulWidget> createState() => _SwitchState(content, index);
}

class _SwitchState extends State<Switch> {
  bool _value = false;
  int _index = -1;
  String _content = "";
  _SwitchState(String content, int index){
    _index = index;
    _content = content;
  }

  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: Text(_content),
      selected: _value,
      onSelected: (v) {
        setState(() {
          if(Global.yes1 == null){

          }
          _value = v;
        });
      },
      selectedColor: Colors.blue,
      selectedShadowColor: Colors.red,
      showCheckmark: true,
      //勾选状态
      pressElevation: 12, //点击效果
    );
  }
}
