import 'package:flutter/material.dart';

class TaskElement extends StatelessWidget {
  final bool state;
  final String name;
  final Function onPressed;

  TaskElement({@required this.state, @required this.name, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
            color: state ? Colors.green : Colors.black,
            fontSize: 17,
          ),
        ),
        Checkbox(
          value: state,
          onChanged: onPressed,
        )
      ],
    );
  }
}
