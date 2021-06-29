import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/models/user.dart';
import 'package:wundertusk/screens/group_task/screens/detail_screen/widgets/user_card.dart';
import 'package:wundertusk/services/providers/task_providers/task_creator_provider.dart';

class TaskCreatorWidget extends StatelessWidget {
  final Task task;

  const TaskCreatorWidget({
    required this.task,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppLocalizations.of(context)!.producer,
            style: AppTextStyles.kSFFootnote,
          ),
          const SizedBox(height: 8.0),
          const Divider(height: 0.0),
          const SizedBox(height: 8.0),
          FutureBuilder<User>(
            future: context.read<TaskCreatorProvider>().getTaskCreator(task),
            builder: (_, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const UserShimmerCard();
              }
              final user = snapshot.data!;

              return Consumer<TaskCreatorProvider>(
                builder: (_, provider, __) {
                  return UserCard(
                    user: user,
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
