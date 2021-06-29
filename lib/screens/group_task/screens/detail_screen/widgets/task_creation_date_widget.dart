import 'package:flutter/material.dart';

import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/resources/app_colors.dart';
import 'package:wundertusk/utils/date_time_formatter.dart';

class TaskCreationDateWidget extends StatelessWidget {
  final Task task;

  const TaskCreationDateWidget({
    required this.task,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: Text(
          'Создано ${DateFormatter.formatToDayMonthHoursMinutes(
            task.creationDate,
          )}',
          style: const TextStyle(color: AppColors.kColBase2),
        ),
      ),
    );
  }
}
