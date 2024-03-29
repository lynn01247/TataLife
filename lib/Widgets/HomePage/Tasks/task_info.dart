import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos_provider.dart';
import 'package:todo_app/translations/locale_keys.g.dart';

class TaskInfo extends StatefulWidget {
  const TaskInfo({Key? key}) : super(key: key);

  @override
  _Task_InfoState createState() => _Task_InfoState();
}

// ignore: camel_case_types
class _Task_InfoState extends State<TaskInfo> {
  @override
  Widget build(BuildContext context) {
    List monthsENNames = [
      '0 index data',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    List monthsZHNames = [
      '0 index data',
      '一月',
      '二月',
      '三月',
      '四月',
      '五月',
      '六月',
      '七月',
      '八月',
      '九月',
      '十月',
      '十一月',
      '十二月',
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 20, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.homescreen_taskstitle.tr(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Consumer<TodosProvider>(
                      builder: (context, state, child) => Text(
                        context.locale == Locale('en')
                            ? LocaleKeys.homescreen_taskssubtitle.tr(args: [
                                '${state.unCompletedTodos.where((Todo) {
                                  return DateTime.fromMillisecondsSinceEpoch(
                                                  Todo.dateMilliseconds)
                                              .day ==
                                          DateTime.now().day &&
                                      DateTime.fromMillisecondsSinceEpoch(
                                                  Todo.dateMilliseconds)
                                              .month ==
                                          DateTime.now().month &&
                                      DateTime.fromMillisecondsSinceEpoch(
                                                  Todo.dateMilliseconds)
                                              .year ==
                                          DateTime.now().year;
                                }).length}',
                                '${DateTime.now().day.toString().padLeft(2, '0')} ${monthsENNames[DateTime.now().month]}'
                              ])
                            : LocaleKeys.homescreen_taskssubtitle.tr(args: [
                                '${DateTime.now().day.toString().padLeft(2, '0')} ${monthsZHNames[DateTime.now().month]}',
                                '${state.unCompletedTodos.where((Todo) {
                                  return DateTime.fromMillisecondsSinceEpoch(
                                                  Todo.dateMilliseconds)
                                              .day ==
                                          DateTime.now().day &&
                                      DateTime.fromMillisecondsSinceEpoch(
                                                  Todo.dateMilliseconds)
                                              .month ==
                                          DateTime.now().month &&
                                      DateTime.fromMillisecondsSinceEpoch(
                                                  Todo.dateMilliseconds)
                                              .year ==
                                          DateTime.now().year;
                                }).length}'
                              ]),
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(14))),
              child: const Icon(Icons.calendar_today),
            ),
          ),
        ],
      ),
    );
  }
}
