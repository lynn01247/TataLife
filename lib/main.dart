import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Models/global_value.dart';
import 'package:todo_app/Pages/life_exam_page.dart';
import 'package:todo_app/Pages/main_screen.dart';
import 'package:todo_app/Pages/welcome_screen.dart';
import 'package:todo_app/provider/todos_provider.dart';
import 'package:todo_app/translations/codegen_loader.g.dart';

/// 1.主要路由 -- 欢迎界面【skipToNext？】/答题界面【defaultScore？】/HOME界面【MainScreen】
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  TodosProvider().initSharedPreferences();
  var skipToNext = await TodosProvider().readName('userName');
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    ChangeNotifierProvider<TodosProvider>(
      create: (BuildContext context) => TodosProvider(),
      child: EasyLocalization(
        path: 'lib/langs',
        supportedLocales: const [
          Locale('en'),
          Locale('zh'),
        ],
        assetLoader: const CodegenLoader(),
        fallbackLocale: const Locale('en'),
        child: MyApp(
          skipToNext: skipToNext.toString(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.skipToNext}) : super(key: key);
  final skipToNext;

  @override
  Widget build(BuildContext context) {
    print("now Score is" + TodosProvider().getScore().toString());
    return MaterialApp(
      title: 'Tata Life',
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      theme: ThemeData(
        primaryColor: HexColor('#f9f6e8'),
      ),
      localizationsDelegates: context.localizationDelegates,
      routes: {'/MainScreen': (context) => const MainScreen()},
      home: skipToNext.toString().contains('null') ? const WelcomeScreen() :
      (TodosProvider().getScore() == Global.defaultScore) ? const LifeExamPage() : const MainScreen(),
    );
  }
}
