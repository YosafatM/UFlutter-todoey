import 'package:flutter/material.dart';
import 'package:todoey/components/task_element.dart';
import 'package:todoey/models/task.dart';

class TaskBody extends StatelessWidget {
  final List<Task> tasks;
  final Function onPressed;

  TaskBody(this.tasks, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskElement(
          name: tasks[index].name,
          state: tasks[index].isCompleted,
          onPressed: onPressed,
        );
      },
    );
  }
}
