import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wundertusk/models/task/task.dart';

import 'package:wundertusk/services/providers/home_providers/providers.dart';
import 'package:wundertusk/services/providers/task_providers/task_list_provider.dart';
import 'package:wundertusk/screens/home/widgets/coming_tasks_frame.dart';
import 'package:wundertusk/screens/home/widgets/expired_tasks_frame.dart';
import 'package:wundertusk/screens/home/widgets/today_tasks_frame.dart';

class TaskView extends StatelessWidget {
  const TaskView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskPriority = context.watch<TaskFilterProvider>().getTaskPriority;
    final list = context.watch<TaskListProvider>().tasks;

    final _expiredTasks =
        list?.where((element) => element.status == TaskStatus.expired).toList();
    final _todayTasks =
        list?.where((element) => element.status == TaskStatus.today).toList();
    final _comingTasks =
        list?.where((element) => element.status == TaskStatus.coming).toList();
    final currentDate =
        DateFormat('dd MMMM', 'ru_RU').format(DateTime.now()).substring(0, 6);
    final tasksFramesList = <Widget>[
      ExpiredTasksFrame(expiredTasks: _expiredTasks ?? List<Task>.empty()),
      TodayTasksFrame(
        currentDate: currentDate,
        todayTasks: _todayTasks ?? List<Task>.empty(),
      ),
      ComingTasksFrame(comingTasks: _comingTasks ?? List<Task>.empty()),
    ];
    _reorderTasksListByPriority(taskPriority, tasksFramesList);

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: tasksFramesList,
    );
  }
}

void _reorderTasksListByPriority(
  String taskPriority,
  List<Widget> tasksFramesList,
) {
  switch (taskPriority) {
    case 'firstPriority':
      break;
    case 'firstExpired':
      tasksFramesList.insert(0, tasksFramesList.removeAt(0));
      break;
    case 'firstToday':
      tasksFramesList.insert(0, tasksFramesList.removeAt(1));
      break;
    case 'firstComing':
      tasksFramesList.insert(0, tasksFramesList.removeAt(2));
      break;
    case 'done':
      break;
  }
}
