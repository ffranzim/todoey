import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: 'Buy milk', isDone: true),
    Task(name: 'Buy eggs', isDone: true),
    Task(name: 'Buy bread', isDone: false),
  ];

  int get taskCount => this.tasks.length;
}
