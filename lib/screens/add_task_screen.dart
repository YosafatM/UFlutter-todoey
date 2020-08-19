import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';

class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name;

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF757575),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 30,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.0),
            topLeft: Radius.circular(25.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add a Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 30,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                name = value;
              },
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              color: Colors.lightBlue,
              onPressed: () {
                Navigator.pop(context, Task(name: name));
              },
            )
          ],
        ),
      ),
    );
  }
}
