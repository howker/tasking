import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/common_widgets/styled_divider.dart';
import 'package:wundertusk/screens/home/widgets/task_item.dart';

class TodayTasksFrame extends StatelessWidget {
  final String currentDate;
  final List<Task> todayTasks;

  const TodayTasksFrame({
    required this.currentDate,
    required this.todayTasks,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 16.0),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '${AppLocalizations.of(context)!.todayTitle}${'$currentDate.'}',
            style: AppTextStyles.kSFBodyMedium.copyWith(
              color: AppColors.kColBase2,
            ),
          ),
        ),
        const SizedBox(height: 14.0),
        const StyledDivider(),
        TaskItems(taskList: todayTasks),
      ],
    );
  }
}
