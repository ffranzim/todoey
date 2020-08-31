import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            itemCount: taskData.taskCount,
            itemBuilder: (context, index) {
              return TaskTile(
                  taskTitle: taskData.tasks[index].name,
                  isChecked: taskData.tasks[index].isDone,
                  checkboxCallback: (bool checkboxState) {
                    taskData.tasks[index].toogleDone();
                  });
            });
      },
    );
  }
}
