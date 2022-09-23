import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/global_value.dart';
import 'package:todo_app/Pages/life_exam_page.dart';
import 'package:todo_app/Widgets/Welcome/welcome_text.dart';
import 'package:todo_app/Widgets/Welcome/welcome_tf.dart';
import 'package:todo_app/provider/todos_provider.dart';
import 'package:todo_app/translations/locale_keys.g.dart';

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
    // debugPaintSizeEnabled = true; // 显示边界布局
    return Scaffold(
      resizeToAvoidBottomInset: false, // 键盘弹出时将不会resize
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: SingleChildScrollView(reverse: true,
            child: Column(
              children: [
                const welcomeText(),
                Padding(padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox( // SizedBox 可以设置子组件的宽度和高度，如果设置无限宽，则会填充父组件。 // SizedBox.expand 则可以扩展父组件，和上面的类似。
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(alignment: Alignment.bottomRight, margin: const EdgeInsets.only(right: 10, bottom: 8),
                            child: ElevatedButton(
                                style: ButtonStyle(alignment: Alignment.center,
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade600),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0),)),
                                ),
                                onPressed: () {
                                  _onBaseInfoDialog(context, "进入应用之前，需要先设置下你的基础信息【姓名和性别】哦。", OnDialogClickListener(
                                      onConfirm: (){
                                        // print("onConfirm skip");
                                      },
                                      onCancel: (){}
                                  ));
                                },
                                child: Text(LocaleKeys.welcomescreen_skip_button.tr(), style: const TextStyle(fontSize: 12),)),
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width / 1.8, height: 50,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.amber.shade600),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0),)),
                                  padding: MaterialStateProperty.all(const EdgeInsets.only(left: 24, right: 24, top: 5, bottom: 5)),
                                  minimumSize: MaterialStateProperty.all(const Size(double.minPositive, double.minPositive)),
                                  maximumSize: MaterialStateProperty.all(const Size(double.infinity, double.maxFinite)),
                                ),
                                onPressed: () {
                                  _onBaseInfoDialog(context, "开始测试之前，需要先设置下你的基础信息【姓名和性别】哦。", OnDialogClickListener(
                                      onConfirm: (){},
                                      onCancel: (){}
                                  ));
                                },
                                child: Text(LocaleKeys.welcomescreen_done_button.tr(), style: const TextStyle(fontSize: 15))),
                          ),
                        ],
                      )),
                ),
              ],
            )),
      ),
    );
  }

  _onBaseInfoDialog(BuildContext context,String content,OnDialogClickListener? listener) {
    showDialog(context: context,
        builder: (context) {
          return BaseInfoDialog(title: "温馨提示", content: content, clickListener: listener);
        });
  }
}

class BaseInfoDialog extends StatefulWidget {
  final String title;
  final String content;
  final String? cancelColor;
  final String? confirmColor;
  final OnDialogClickListener? clickListener;

  BaseInfoDialog({
    this.cancelColor = '#00000',
    this.confirmColor = '#576B95',
    this.title = '标题',
    this.content = '',
    this.clickListener,
    Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BaseInfoDialogState(this.title, this.content, this.clickListener);
}
class _BaseInfoDialogState extends State<BaseInfoDialog> {
  String title = "";
  String content = "";
  OnDialogClickListener? clickListener;

  int sex = 1;
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController(text: TodosProvider().getName());
  var surnameController = TextEditingController(text: TodosProvider().getSurname());

  _BaseInfoDialogState(String t, String c, OnDialogClickListener? listener){
    title = t;
    content = c;
    clickListener = listener;
  }


  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child:
          Consumer<TodosProvider>(builder: (context, state, child) => Material(type: MaterialType.transparency,
            child: Center(
                child: Container(height: 410, width: 300, color: Colors.white,
                    child: Column(children: [
                      Padding(
                          padding: const EdgeInsets.all(15),
                          child: Stack(
                            children: <Widget>[
                              Align(alignment: Alignment.center, child: Text(title)),
                              Align(alignment: Alignment.centerRight,
                                child: InkWell(child: const Icon(Icons.close), onTap: () => {Navigator.pop(context)},),)],)),
                      const Divider(color: Colors.grey, height: 2, thickness: 2, indent: 15.0, endIndent: 15.0,),
                      Container(
                        padding: const EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 10),
                        width: double.infinity,
                        child: Text(content, textAlign: TextAlign.left, style: const TextStyle(fontSize: 15),),
                      ),
                      Form(
                        // autovalidateMode: AutovalidateMode.always,
                        // onChanged: () {
                        //   Form.of(primaryFocus!.context!)!.save();
                        //   // TodosProvider().setName(nameController.text);
                        //   // TodosProvider().setSurName(surnameController.text);
                        //   state.setName(nameController.text);
                        //   state.setSurName(surnameController.text);
                        // },
                        key: formKey,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Column(children: [
                            WelcomCustomTF(controller: surnameController, labelText: LocaleKeys.welcomescreen_surname_tf.tr()),
                            WelcomCustomTF(controller: nameController, labelText: LocaleKeys.welcomescreen_name_tf.tr(),),
                            Padding(padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  const Text("性别："),
                                  Row(
                                    children: <Widget>[
                                      Radio(groupValue: sex, value: 1, onChanged: (v) {setState(() {sex = v as int;});}),
                                      const Text('男')
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Radio(groupValue: sex, value: 0, onChanged: (v) {setState(() {sex = v as int;});},),
                                      const Text('女')
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(height: 50, alignment: Alignment.bottomRight, margin: const EdgeInsets.only(right: 10),
                              child: ElevatedButton(
                                  style: ButtonStyle(alignment: Alignment.center,
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade600),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0),)),
                                  ),
                                  onPressed: () => {
                                        clickListener?.onCancel(),
                                        Navigator.of(context).pop()
                                      },
                                  child: const Text("取消", style: TextStyle(fontSize: 12),)),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.5, height: 50,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.amber.shade400),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0),)),
                                    padding: MaterialStateProperty.all(const EdgeInsets.only(left: 24, right: 24, top: 5, bottom: 5)),
                                    minimumSize: MaterialStateProperty.all(const Size(double.minPositive, double.minPositive)),
                                    maximumSize: MaterialStateProperty.all(const Size(double.infinity, double.maxFinite)),),
                                  onPressed: () {
                                    bool validResult = formKey.currentState!.validate();
                                    if (validResult == true) {
                                      state.setName(nameController.text);
                                      state.setSurName(surnameController.text);
                                      state.setGender(sex);
                                      state.setSkip("no");
                                      clickListener?.onConfirm();
                                      Navigator.of(context).pop();
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const LifeExamPage()));
                                    }
                                  },
                                  child: const Text("确定", style: TextStyle(fontSize: 14))),
                            ),
                          ],
                        ),
                      )
                    ])
                )
            )
          ),
      ),
    );
  }
}
