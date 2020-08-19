import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/task_element.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/add_task_screen.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Task task = await showModalBottomSheet(
            context: context,
            builder: (context) => AddTask(),
          );

          if (task != null) {
            if (task.name != null) {
              Provider.of<TaskData>(context, listen: false).addTask(task);
            }
          }
        },
        backgroundColor: Colors.lightBlue,
        child: Icon(Icons.add),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(top: 60.0, left: 30, bottom: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlue,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${Provider.of<TaskData>(context).tasks.length} tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                  ),
                ),
                child: ListView.builder(
                  itemCount: Provider.of<TaskData>(context).tasks.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onLongPress: () {
                        Provider.of<TaskData>(context, listen: false)
                            .deleteTask(index);
                      },
                      child: TaskElement(
                        name: Provider.of<TaskData>(context).tasks[index].name,
                        state: Provider.of<TaskData>(context)
                            .tasks[index]
                            .isCompleted,
                        onPressed: (bool value) {
                          Provider.of<TaskData>(context, listen: false)
                              .changeStatus(index, value);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
