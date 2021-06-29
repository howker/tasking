import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/screens/new_task/widgets/task_settings/repeat.dart';
import 'package:wundertusk/screens/new_task/widgets/task_settings/repeat_count.dart';
import 'package:wundertusk/screens/new_task/widgets/task_settings/repeat_days.dart';
import 'package:wundertusk/screens/new_task/widgets/task_settings/repeat_stop.dart';

class TaskSettingsDialog extends StatelessWidget {
  final DateTime date;

  const TaskSettingsDialog({
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(17.0, 78.0, 18.0, 0.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppColors.kColBackground,
        ),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 12.0),
                child: Text(
                  AppLocalizations.of(context)!.repeat,
                  style: AppTextStyles.kSFTitle,
                ),
              ),
              const Repeat(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  AppLocalizations.of(context)!.repeatCount,
                  style: AppTextStyles.kSFSubhead,
                ),
              ),
              const RepeatCount(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 24.0),
                child: Text(
                  AppLocalizations.of(context)!.repeatDays,
                  style: AppTextStyles.kSFSubhead,
                ),
              ),
              const RepeatDays(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 24.0, 0.0, 16.0),
                child: Text(
                  AppLocalizations.of(context)!.repeatStop,
                  style: AppTextStyles.kSFSubhead,
                ),
              ),
              const RepeatStop(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40.0),
                  primary: AppColors.kColAccentNormal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45.0),
                  ),
                ),
                onPressed: () {
                  // context.read<NewTaskProvider>().setDate(date);
                  Navigator.of(context).pop();
                },
                child: Text(AppLocalizations.of(context)!.save),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
