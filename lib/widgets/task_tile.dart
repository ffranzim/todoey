import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressCallback;

  TaskTile(
      {this.taskTitle,
      this.isChecked = false,
      this.checkboxCallback,
      this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          this.taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        onLongPress: this.longPressCallback,
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: this.isChecked,
          onChanged: this.checkboxCallback,
        ));
  }
}
