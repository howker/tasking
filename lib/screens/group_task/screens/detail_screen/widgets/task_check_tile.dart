import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';

class TaskCheckTile extends StatefulWidget {
  const TaskCheckTile({
    Key? key,
  }) : super(key: key);

  @override
  _TaskCheckTileState createState() => _TaskCheckTileState();
}

class _TaskCheckTileState extends State<TaskCheckTile> {
  bool taskStatus = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            AppLocalizations.of(context)!.tempSecondTask,
            style: TextStyle(
              color: taskStatus ? Colors.grey : Colors.black,
              decoration:
                  taskStatus ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
          leading: taskStatus
              ? IconButton(
                  color: Colors.black,
                  icon: const Icon(Icons.check_circle_outline_outlined),
                  onPressed: () {
                    setState(() {
                      taskStatus = false;
                    });
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.radio_button_unchecked),
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      taskStatus = true;
                    });
                  },
                ),
        ),
        const Divider(),
      ],
    );
  }
}
