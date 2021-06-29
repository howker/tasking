import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/models/task_image.dart';
import 'package:wundertusk/resources/app_colors.dart';
import 'package:wundertusk/resources/app_icons.dart';
import 'package:wundertusk/services/providers/task_providers/task_attachments_provider.dart';

class TaskImageScreen extends StatelessWidget {
  final TaskImage taskImage;

  const TaskImageScreen({
    required this.taskImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.backButton,
          style: const TextStyle(color: AppColors.kColBase),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              context
                  .read<TaskAttachmentsProvider>()
                  .deleteImageFromTask(taskImage)
                  .then((_) => Navigator.pop(context));
            },
            icon: const CustomIcon(
              customIcon: AppIcons.kIconDelete,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Hero(
            tag: '${taskImage.id}',
            child: Image.network(taskImage.url),
          ),
        ),
      ),
    );
  }
}
