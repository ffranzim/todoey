import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy milk', isDone: true),
    Task(name: 'Buy eggs', isDone: true),
    Task(name: 'Buy bread', isDone: false),
  ];

  int get taskCount => this._tasks.length;

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void updateTask(Task task) {
    task.toogleDone();
    notifyListeners();
  }
}
