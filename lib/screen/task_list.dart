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
              final taskItem = taskData.tasks[index];
              return TaskTile(
                taskTitle: taskItem.name,
                isChecked: taskItem.isDone,
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(taskItem);
                },
                longPressCallback: () {
                  taskData.removeTask(taskItem);
                },
              );
            });
      },
    );
  }
}
