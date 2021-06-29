import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/common_widgets/user_picker_bottom_sheet/user_picker_bottom_sheet.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/models/executor.dart';
import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/screens/group_task/screens/detail_screen/widgets/user_card.dart';
import 'package:wundertusk/services/providers/task_providers/task_executors_provider.dart';

class TaskExecutorsWidget extends StatelessWidget {
  final Task task;

  const TaskExecutorsWidget({
    required this.task,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _executorsProvider = context.read<TaskExecutorsProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppLocalizations.of(context)!.executor,
            style: AppTextStyles.kSFFootnote,
          ),
          const SizedBox(height: 8.0),
          const Divider(height: 0.0),
          const SizedBox(height: 12.0),
          FutureBuilder<void>(
            future: _executorsProvider.loadTaskExecutorsList(task),
            builder: (_, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Column(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: UserShimmerCard(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: UserShimmerCard(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: UserShimmerCard(),
                    ),
                  ],
                );
              }

              return Selector<TaskExecutorsProvider, int?>(
                selector: (_, provider) => provider.cachedTaskExecutors?.length,
                builder: (_, __, ___) {
                  return Selector<TaskExecutorsProvider, List<Executor>?>(
                    selector: (_, provider) => provider.cachedTaskExecutors,
                    builder: (_, taskExecutors, __) {
                      if (taskExecutors == null || taskExecutors.isEmpty) {
                        return Wrap(
                          children: <Widget>[
                            const Text(
                              'К данной задаче не прикреплен ни один исполнитель. ',
                            ),
                            InkWell(
                              onTap: () {
                                pickUsers(
                                  context,
                                  predefinedUsers: _executorsProvider
                                      .cachedTaskExecutorsAsUsers,
                                ).then((pickedUsers) {
                                  _executorsProvider.saveTaskExecutors(
                                    task,
                                    pickedUsers,
                                  );
                                });
                              },
                              child: Text(
                                'Изменить ',
                                style: AppTextStyles.kSFCaption.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        );
                      }

                      return Column(
                        children: taskExecutors.map((executor) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: UserCard(
                              user: executor.user,
                              subtitle: InkWell(
                                onTap: () {
                                  pickUsers(
                                    context,
                                    predefinedUsers: _executorsProvider
                                        .cachedTaskExecutorsAsUsers,
                                  ).then((pickedUsers) {
                                    _executorsProvider.saveTaskExecutors(
                                      task,
                                      pickedUsers,
                                    );
                                  });
                                },
                                child: Text(
                                  'Изменить ',
                                  style: AppTextStyles.kSFCaption.copyWith(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              trailing: GestureDetector(
                                onTap: () {
                                  _executorsProvider.deleteTaskExecutor(
                                    task,
                                    executor,
                                  );
                                },
                                child: const CustomIcon(
                                  width: 26.0,
                                  height: 26.0,
                                  customIcon: AppIcons.kIconCloseCircle,
                                  color: AppColors.kColBase2,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
