import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/Models/global_value.dart';
import 'package:todo_app/Models/todo.dart';
import 'package:todo_app/provider/shared_prefences_helper.dart';

class TodosProvider extends ChangeNotifier {
  SharedPreferences? sharedPreferences;
  String _name = '';
  String _surname = '';
  num _gender = -1;
  double _score = Global.defaultScore;
  String imageKey = "IMAGE_KEY";
  Uint8List? imagebytes;
  Uint8List? profileImage;

  //initial state
  List<Todo> todos = [];

  List<Todo> todosList = [];

  List<Todo> completedTodosList = [];

  List<Todo> getTodos(DateTime day) {
    todosList = unCompletedTodos.where((Todo) {
      return DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds).day ==
              day.day &&
          DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds).month ==
              day.month &&
          DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds).year ==
              day.year;
    }).toList();
    return todosList;
  }

  //  getter
  String get name => _name;
  String get surname => _surname;
  num get gender => _gender;
  double get score => _score;
  UnmodifiableListView<Todo> get allTodos =>
      UnmodifiableListView(todos.reversed);

  UnmodifiableListView<Todo> get completedTodos =>
      UnmodifiableListView(todos.reversed.where((todo) => todo.complete));

  UnmodifiableListView<Todo> get unCompletedTodos =>
      UnmodifiableListView(todos.reversed.where((todo) => !todo.complete));

//  methods for To-do
  void addTodo(Todo todo) {
    todos.add(todo);
    saveDataToLocalStorage();
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    todos.remove(todo);
    updateDataToLocalStorage();
    checkCompletedTodos();
    notifyListeners();
  }

  void toggleTodo(Todo todo) {
    var index = todos.indexOf(todo);
    todos[index].toggleCompleted();
    updateDataToLocalStorage();
    notifyListeners();
  }

  void editTodo(Todo todo, String titleText, String description,
      String category, int dateMilliseconds, int timeMilliseconds) {
    todo.title = titleText;
    todo.description = description;
    todo.category = category;
    todo.dateMilliseconds = dateMilliseconds;
    todo.timeMilliseconds = timeMilliseconds;
    updateDataToLocalStorage();
    notifyListeners();
  }

  // For delete completed todos
  bool checkCompletedTodos() {
    if (completedTodos.isEmpty) {
      notifyListeners();
      return true;
    }
    notifyListeners();
    return false;
  }

  void removeCompletedTodos() {
    todos.forEach((todo) {
      if (todo.complete) {
        completedTodosList.add(todo);
        notifyListeners();
      }
    });
    todos.removeWhere((todo) => completedTodosList.contains(todo));
    updateDataToLocalStorage();
    notifyListeners();
  }

  // methods for shared preferences
  void initSharedPreferences() async {
    // sharedPreferences = await SharedPreferences.getInstance();
    await SharedPreferencesHelper.init();
    sharedPreferences = SharedPreferencesHelper.instance;
    loadDataFromLocalStorage();
    getName();
    getSurname();
    notifyListeners();
  }

  void saveDataToLocalStorage() {
    List<String>? spList = todos.map((todo) => json.encode(todo.toJson())).toList();
    sharedPreferences ??= SharedPreferencesHelper.instance;
    sharedPreferences!.setStringList('list', spList);
  }

  void loadDataFromLocalStorage() {
    List<String>? spList = sharedPreferences!.getStringList('list');
    if (spList != null) {
      todos = spList.map((item) => Todo.fromMap(json.decode(item))).toList();
    }
  }

  void updateDataToLocalStorage() {
    List<String>? spList =
        todos.map((item) => json.encode(item.toJson())).toList();
    sharedPreferences ??= SharedPreferencesHelper.instance;
    sharedPreferences?.remove('list');
    sharedPreferences!.setStringList('list', spList);
  }

  void saveName(String userText) {
    _name = userText;
    sharedPreferences ??= SharedPreferencesHelper.instance;
    sharedPreferences!.setString('userName', userText);
    notifyListeners();
  }

  void saveSurname(String userText) {
    _surname = userText;
    sharedPreferences ??= SharedPreferencesHelper.instance;
    sharedPreferences!.setString('userSurname', userText);
    notifyListeners();
  }

  void saveGender(int gender){
    _gender = gender;
    sharedPreferences ??= SharedPreferencesHelper.instance;
    sharedPreferences!.setInt('gender', gender);
    notifyListeners();
  }

  void saveScore(double score){
    _score = score;
    sharedPreferences ??= SharedPreferencesHelper.instance;
    sharedPreferences!.setDouble('score', score);
    notifyListeners();
  }

  // To-do Percent Method
  double calcTodoPercent(DateTime day) {
    double percent = (completedTodos
            .where((Todo) =>
                DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds)
                    .day ==
                DateTime.now().day)
            .length /
        allTodos
            .where((Todo) =>
                DateTime.fromMillisecondsSinceEpoch(Todo.dateMilliseconds)
                    .day ==
                DateTime.now().day)
            .length);
    return (completedTodos == 0 && unCompletedTodos == 0) ? 0 : percent;
  }

  // Name and Surname Methods
  void setName(String userText) {
    if (userText.isEmpty) {
    } else {
      saveName(userText);
      notifyListeners();
    }
  }

  void setSurName(String userText) {
    if (userText.isEmpty) {
    } else {
      saveSurname(userText);
      notifyListeners();
    }
  }

  void setGender(int gender){
    if (gender==1 || gender==0) {
      saveGender(gender);
      notifyListeners();
    }
  }

  String getName() {
    sharedPreferences ??= SharedPreferencesHelper.instance;
    String? spName = sharedPreferences?.getString('userName');
    if (spName != null) {
      _name = spName;
      notifyListeners();
      return spName;
    } else {
      return "";
    }
  }

  String getSurname() {
    sharedPreferences ??= SharedPreferencesHelper.instance;
    String? spName = sharedPreferences!.getString('userSurname');
    if (spName != null) {
      _surname = spName;
      notifyListeners();
      return spName;
    } else {
      return "";
    }
  }

  int getGender(){
    sharedPreferences ??= SharedPreferencesHelper.instance;
    int? gender = sharedPreferences!.getInt('gender');
    if (gender != null) {
      _gender = gender;
      notifyListeners();
      return gender;
    } else {
      return -1;
    }
  }

  double getScore(){
    sharedPreferences ??= SharedPreferencesHelper.instance;
    double? score = sharedPreferences!.getDouble('score');
    if (score != null) {
      _score = score;
      notifyListeners();
      return score;
    } else {
      return -999;
    }
  }

  // Check Name
  Future<dynamic> readName(String key) async {
    final prefs = await SharedPreferences.getInstance();
    dynamic obj = prefs.get(key);
    return obj;
  }

  // For profile picture
  Future pickImage(BuildContext context) async {
    XFile? image;
    try {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
    } catch (e) {
      showOkAlertDialog(
          context: context,
          title: 'Permission Error',
          message:
              'You need to give permission to access the gallery in the settings.');
    }

    if (image != null) {
      imagebytes = await image.readAsBytes();
      imageToBase64(imagebytes!);
      notifyListeners();
      base64ToImage();
      notifyListeners();
    }
  }

  void imageToBase64(Uint8List imageBytes) {
    sharedPreferences ??= SharedPreferencesHelper.instance;
    sharedPreferences!.setString(imageKey, base64.encode(imageBytes));
    notifyListeners();
  }

  Uint8List? base64ToImage() {
    sharedPreferences ??= SharedPreferencesHelper.instance;
    var data = sharedPreferences!.getString(imageKey);
    data == null ? null : profileImage = base64.decode(data);
    return profileImage;
  }
}
