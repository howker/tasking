import 'package:flutter/material.dart';

import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/common_widgets/styled_divider.dart';
import 'package:wundertusk/screens/home/widgets/expired_title.dart';
import 'package:wundertusk/screens/home/widgets/task_item.dart';

class ExpiredTasksFrame extends StatelessWidget {
  final List<Task> _expiredTasks;

  const ExpiredTasksFrame({
    required List<Task> expiredTasks,
    Key? key,
  })  : _expiredTasks = expiredTasks,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 16.0),
        const ExpiredTitle(),
        const StyledDivider(),
        TaskItems(
          taskList: _expiredTasks,
          isExpired: true,
        ),
      ],
    );
  }
}
