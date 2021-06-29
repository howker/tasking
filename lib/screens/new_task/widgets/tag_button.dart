import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/tag_providers/tag_list_provider.dart';
import 'package:wundertusk/services/providers/task_providers/new_task_provider.dart';

class TagButton extends StatelessWidget {
  const TagButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allTagsList =
        context.watch<TagListProvider>().tags.map((tag) => tag.name).toList();
    final taskTagsList = context.watch<NewTaskProvider>().tags;

    return PopupMenuButton<String>(
      icon: const CustomIcon(customIcon: AppIcons.kIconTag),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      onSelected: (tag) {
        taskTagsList.contains(tag)
            ? context.read<NewTaskProvider>().deleteTagFromTask(tag)
            : context.read<NewTaskProvider>().addTagToTask(tag);
      },
      itemBuilder: (_) {
        return allTagsList
            .map(
              (tag) => PopupMenuItem(
                value: tag,
                child: Row(
                  children: <Widget>[
                    const CustomIcon(customIcon: AppIcons.kIconTag),
                    const SizedBox(width: 16),
                    Text(
                      tag,
                      style: TextStyle(
                        color: taskTagsList.contains(tag)
                            ? AppColors.kColAccentActive
                            : AppColors.kColBase,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList();
      },
    );
  }
}
