import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/task_providers/task_list_provider.dart';
import 'package:wundertusk/screens/home/widgets/menu/components/components.dart';

class TasksGroups extends StatelessWidget {
  const TasksGroups({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _taskListProvider = context.read<TaskListProvider>();
    final _currentFilter = context.watch<TaskListProvider>().currentFilter;

    return Column(
      children: [
        TasksListTile(
          iconAssetPath: AppIcons.kIconTray,
          groupName: AppLocalizations.of(context)!.allMyTasks,
          iconColor: AppColors.kColAccent2,
          backgroundColor: _currentFilter == TaskGroupFilter.allTasks
              ? AppColors.kColBase4
              : AppColors.kColBackground,
          onTap: () {
            _taskListProvider.setTasks(
              filter: TaskGroupFilter.allTasks,
              groupName: AppLocalizations.of(context)!.allMyTasks,
            );
          },
        ),
        TasksListTile(
          iconAssetPath: AppIcons.kIconPinIt,
          groupName: AppLocalizations.of(context)!.favoriteTasks,
          iconColor: AppColors.kColAccentNormal,
          backgroundColor: _currentFilter == TaskGroupFilter.favorites
              ? AppColors.kColBase4
              : AppColors.kColBackground,
          onTap: () {
            _taskListProvider.setTasks(
              filter: TaskGroupFilter.favorites,
              groupName: AppLocalizations.of(context)!.favoriteTasks,
            );
          },
        ),
        TasksListTile(
          iconAssetPath: AppIcons.kIconCalendar31,
          groupName: AppLocalizations.of(context)!.tasksToday,
          iconColor: AppColors.kColNotSuccess,
          backgroundColor: _currentFilter == TaskGroupFilter.today
              ? AppColors.kColBase4
              : AppColors.kColBackground,
          onTap: () {
            _taskListProvider.setTasks(
              filter: TaskGroupFilter.today,
              groupName: AppLocalizations.of(context)!.tasksToday,
            );
          },
        ),
      ],
    );
  }
}
