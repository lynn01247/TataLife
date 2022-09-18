import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/GlobalValue.dart';
import 'package:todo_app/Pages/life_exam_page.dart';
import 'package:todo_app/Widgets/Welcome/welcome_text.dart';
import 'package:todo_app/Widgets/Welcome/welcome_tf.dart';
import 'package:todo_app/provider/todos_provider.dart';
import 'package:todo_app/translations/locale_keys.g.dart';

import 'main_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // ignore: prefer_typing_uninitialized_variables
  late var isSkip;

  @override
  void initState() {
    super.initState();
    Provider.of<TodosProvider>(context, listen: false).initSharedPreferences();
    Global.examList.shuffle(); // 随机排列试卷
    isSkip = TodosProvider().readName('skip');
  }

  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true ;// 显示边界布局
    var nameController = TextEditingController();
    var surnameController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: [
                const welcomeText(),
                // Form(
                //   key: formKey,
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         left: 15.0, right: 15, bottom: 10),
                //     child: Column(children: [
                //       WelcomCustomTF(
                //           controller: nameController,
                //           labelText: LocaleKeys.welcomescreen_name_tf.tr()),
                //       WelcomCustomTF(
                //           controller: surnameController,
                //           labelText: LocaleKeys.welcomescreen_surname_tf.tr()),
                //     ]),
                //   ),
                // ),
                Consumer<TodosProvider>(
                  builder: (context, state, child) => Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                        // SizedBox 可以设置子组件的宽度和高度，如果设置无限宽，则会填充父组件。
                        // SizedBox.expand 则可以扩展父组件，和上面的类似。
                        height: MediaQuery.of(context).size.height / 10,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              alignment: Alignment.bottomRight,
                              margin:
                                  const EdgeInsets.only(right: 10, bottom: 8),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    // const ButtonStyle({
                                    //   this.textStyle, //字体
                                    //   this.backgroundColor, //背景色
                                    //   this.foregroundColor, //前景色
                                    //   this.overlayColor, // 高亮色，按钮处于focused, hovered, or pressed时的颜色
                                    //   this.shadowColor, // 阴影颜色
                                    //   this.elevation, // 阴影值
                                    //   this.padding, // padding
                                    //   this.minimumSize, //最小尺寸
                                    //   this.side, //边框
                                    //   this.shape, //形状
                                    //   this.mouseCursor, //鼠标指针的光标进入或悬停在此按钮的[InkWell]上时。
                                    //   this.visualDensity, // 按钮布局的紧凑程度
                                    //   this.tapTargetSize, // 响应触摸的区域
                                    //   this.animationDuration, //[shape]和[elevation]的动画更改的持续时间。
                                    //   this.enableFeedback, // 检测到的手势是否应提供声音和/或触觉反馈。例如，在Android上，点击会产生咔哒声，启用反馈后，长按会产生短暂的振动。通常，组件默认值为true。
                                    // });
                                    alignment: Alignment.center,
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.grey.shade600),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13.0),
                                    )),
                                  ),
                                  onPressed: () {
                                    // bool validResult = formKey.currentState!.validate();
                                    // if (validResult == true) {
                                    state.setSkip("");
                                    // state.setsurName(surnameController.text);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MainScreen()));
                                    // }
                                  },
                                  child: Text(
                                    LocaleKeys.welcomescreen_skip_button.tr(),
                                    style: TextStyle(fontSize: 12),
                                  )),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.8,
                              height: 50,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.amber.shade600),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(13.0),
                                    )),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.only(
                                            left: 24,
                                            right: 24,
                                            top: 5,
                                            bottom: 5)),
                                    minimumSize: MaterialStateProperty.all(
                                        const Size(double.minPositive,
                                            double.minPositive)),
                                    maximumSize: MaterialStateProperty.all(
                                        const Size(
                                            double.infinity, double.maxFinite)),
                                  ),
                                  onPressed: () {
                                    // bool validResult = formKey.currentState!.validate();
                                    // if (validResult == true) {
                                    // state.setName(nameController.text);
                                    state.setSkip("no");
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LifeExamPage()));
                                    // }
                                  },
                                  child: Text(
                                      LocaleKeys.welcomescreen_done_button.tr(),
                                      style: TextStyle(fontSize: 15))),
                            ),
                          ],
                        )),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
