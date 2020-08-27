import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is a task.',
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskCheckbox(
          isChecked: this.isChecked,
          toogleCheckboxState: (bool newValue) {
            setState(() {
              this.isChecked = newValue;
            });
          }),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  final bool isChecked;
  final Function toogleCheckboxState;

  TaskCheckbox({this.toogleCheckboxState, this.isChecked});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: this.isChecked,
      onChanged: toogleCheckboxState,
    );
  }
}
