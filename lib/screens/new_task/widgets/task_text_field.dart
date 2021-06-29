import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/task_providers/task_create_provider.dart';
import 'package:wundertusk/services/providers/task_providers/task_list_provider.dart';

class TaskTextField extends StatefulWidget {
  const TaskTextField({
    Key? key,
  }) : super(key: key);

  @override
  _TaskTextFieldState createState() => _TaskTextFieldState();
}

class _TaskTextFieldState extends State<TaskTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final createProvider = context.read<TaskCreateProvider>();
    final taskListProvider = context.read<TaskListProvider>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              controller: _controller,
              onChanged: (text) {
                context.read<TaskCreateProvider>().createdTaskTitle = text;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: AppLocalizations.of(context)!.addTask,
              ),
            ),
          ),
          Container(
            height: 40.0,
            width: 40.0,
            decoration: const BoxDecoration(
              color: AppColors.kColBGAccentButton,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const CustomIcon(
                customIcon: AppIcons.kIconSend,
                color: AppColors.kColAccentNormal,
              ),
              onPressed: () async {
                final createdTask = await createProvider.createTask();
                if (createdTask != null) {
                  await taskListProvider.loadTasksList();
                  if (mounted) {
                    await Navigator.popAndPushNamed(
                      context,
                      RoutePaths.taskDetailScreen,
                      arguments: createdTask,
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
