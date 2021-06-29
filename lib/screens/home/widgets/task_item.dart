import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wundertusk/common_widgets/user_avatar.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/models/user.dart';
import 'package:wundertusk/services/providers/task_providers/task_creator_provider.dart';
import 'package:wundertusk/services/providers/task_providers/task_list_provider.dart';
import 'package:wundertusk/utils/date_time_formatter.dart';
import 'package:wundertusk/common_widgets/styled_divider.dart';

class TaskItems extends StatelessWidget {
  final List<Task> taskList;
  final bool isExpired;

  const TaskItems({
    required this.taskList,
    this.isExpired = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = SlidableController();

    return Column(
      children: taskList.map((task) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              RoutePaths.taskDetailScreen,
              arguments: task,
            );
          },
          child: Slidable(
            controller: controller,
            actionPane: const SlidableScrollActionPane(),
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const CustomIcon(
                  customIcon: AppIcons.kIconPushPin,
                  height: 24.0,
                  width: 24.0,
                  color: AppColors.kColBase1,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.read<TaskListProvider>().deleteTask(task);

                  controller.activeState?.close();
                },
                icon: const CustomIcon(
                  customIcon: AppIcons.kIconDelete,
                  height: 24.0,
                  width: 24.0,
                  color: AppColors.kColBase1,
                ),
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 18.0,
                        width: 18.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: task.status == TaskStatus.expired
                                ? AppColors.kColNotFailed
                                : AppColors.kColBase2,
                            width: 2.0,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 11.0),
                      Expanded(
                        child: Text(
                          task.title,
                          overflow: TextOverflow.clip,
                          style: AppTextStyles.kSFBody,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32.0, 8.0, 0.0, 12.0),
                    child: Row(
                      children: <Widget>[
                        FutureBuilder<User>(
                          future: context
                              .read<TaskCreatorProvider>()
                              .getTaskCreator(task),
                          builder: (_, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: const CircleAvatar(radius: 10.0),
                              );
                            }
                            final user = snapshot.data!;

                            return UserAvatar(user: user, radius: 10.0);
                          },
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: CustomIcon(
                            customIcon: AppIcons.kIconArrowRight,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Row(
                              children: task.executors.take(2).map((e) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: CircleAvatar(
                                    radius: 10.0,
                                    child: Text(
                                      e.user.fullName[0],
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            if (task.executors.length > 2)
                              Text('+ ${task.executors.length - 2} исп.'),
                          ],
                        ),
                        const SizedBox(width: 18.0),
                        CustomIcon(
                          customIcon: AppIcons.kIconTime2,
                          height: 14.0,
                          width: 14.0,
                          color: task.status == TaskStatus.expired
                              ? AppColors.kColNotFailed
                              : AppColors.kColBase2,
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          task.deadline != null
                              ? DateFormatter.formatToDayAbbrMonthHoursMinutes(
                                  task.deadline!,
                                )
                              : '-',
                          style: AppTextStyles.kSFFootnoteAndSubhead.copyWith(
                            color: task.status == TaskStatus.expired
                                ? AppColors.kColNotFailed
                                : AppColors.kColBase2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const StyledDivider(),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
