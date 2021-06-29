import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/screens/group_task/screens/detail_screen/details_screen_widgets.dart';

class DetailTab extends StatelessWidget {
  final Task task;

  const DetailTab({
    required this.task,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    task.title,
                    style: AppTextStyles.kSFHeadline1,
                  ),
                ),
                TaskTagsWidget(usersTagNames: task.userTags),
                const DateAndGroup(),
                const TaskActionButtons(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    AppLocalizations.of(context)!.taskDescription,
                    style: AppTextStyles.kSFFootnote.copyWith(
                      color: AppColors.kColBase2,
                    ),
                  ),
                ),
                TaskCreatorWidget(task: task),
                TaskExecutorsWidget(task: task),
                TaskAttachedImages(task: task),
                TaskAttachedFiles(task: task),
                TaskCreationDateWidget(task: task),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: DetailBottomBar(task: task),
    );
  }
}
