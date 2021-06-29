import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/task_providers/task_list_provider.dart';

class HomeScreenAppBarTitle extends StatelessWidget {
  const HomeScreenAppBarTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groupName = context.watch<TaskListProvider>().currentGroupName;

    return Text(
      groupName.isNotEmpty
          ? groupName
          : AppLocalizations.of(context)!.allMyTasks,
      style: AppTextStyles.kSFHeadline2.copyWith(color: AppColors.kColBase),
    );
  }
}
