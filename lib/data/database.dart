import 'package:hive_flutter/hive_flutter.dart';

class NotesDataBase {
  List notesList = [];

  // reference our box
  final _notesBox = Hive.box('notesBox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    notesList = [
      ["Note one", "Para 1", false],
      ["Note Two", "Para 2", false],
    ];
  }

  // load the data from database
  void loadData() {
    notesList = _notesBox.get("NOTESLIST");
  }

  // update the database
  void updateDataBase() {
    _notesBox.put("NOTESLIST", notesList);
  }
}

//ToDo database
class ToDoDataBase {
  List toDoList = [];

  // reference our box
  final _todoBox = Hive.box('todoBox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ["One Task", false],
      ["Task Two", false],
    ];
  }

  // load the data from database
  void loadData() {
    toDoList = _todoBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _todoBox.put("TODOLIST", toDoList);
  }
}