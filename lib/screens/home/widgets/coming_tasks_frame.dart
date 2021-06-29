import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/common_widgets/styled_divider.dart';
import 'package:wundertusk/screens/home/widgets/task_item.dart';

class ComingTasksFrame extends StatelessWidget {
  final List<Task> _comingTasks;

  const ComingTasksFrame({
    required List<Task> comingTasks,
    Key? key,
  })  : _comingTasks = comingTasks,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 16.0),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppLocalizations.of(context)!.comingTitle,
            style: AppTextStyles.kSFBodyMedium.copyWith(
              color: AppColors.kColAccent3,
            ),
          ),
        ),
        const SizedBox(height: 14.0),
        const StyledDivider(),
        TaskItems(taskList: _comingTasks),
      ],
    );
  }
}
