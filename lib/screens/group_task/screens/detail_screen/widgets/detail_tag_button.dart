import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/group_task_providers/group_task_provider.dart';
import 'package:wundertusk/services/providers/tag_providers/tag_list_provider.dart';

class DetailTagButton extends StatelessWidget {
  const DetailTagButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskId = context.read<int>();
    context.read<GroupTaskProvider>().getTaskTags(id: taskId);
    final allTagsList =
        context.watch<TagListProvider>().tags.map((tag) => tag.name).toList();
    final taskTagsList = context.watch<GroupTaskProvider>().tags;

    return PopupMenuButton<String>(
      icon: const CustomIcon(customIcon: AppIcons.kIconTag),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      onSelected: (tag) {
        taskTagsList.contains(tag)
            ? context
                .read<GroupTaskProvider>()
                .deleteTagFromTask(tag: tag, id: taskId)
            : context
                .read<GroupTaskProvider>()
                .addTagToTask(tag: tag, id: taskId);
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
