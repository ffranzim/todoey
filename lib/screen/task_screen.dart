import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/screen/add_task_screen.dart';
import 'package:todoey_flutter/screen/task_list.dart';

const kLightBlueAccent = Colors.lightBlueAccent;
const kWhite = Colors.white;

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
//              isScrollControlled: true,
            context: context,
            builder: (context) =>
                AddTaskScreen(addTaskCallback: (newTaskTitle) {
              Provider.of<TaskData>(context)
                  .tasks
                  .add(Task(name: newTaskTitle));
              Navigator.pop(context);
            }),
          );
        },
        backgroundColor: kLightBlueAccent,
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: kLightBlueAccent,
                  ),
                  backgroundColor: kWhite,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                      color: kWhite,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(
                    color: kWhite,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              child: TaskList(),
            ),
          )
        ],
      ),
    );
  }
}
