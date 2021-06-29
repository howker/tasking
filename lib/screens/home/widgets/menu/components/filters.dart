import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/tag_providers/tag_list_provider.dart';
import 'package:wundertusk/screens/home/widgets/custom_expansion_tile.dart';
import 'package:wundertusk/common_widgets/custom_list_tile.dart';
import 'package:wundertusk/screens/home/widgets/menu/components/components.dart';
import 'package:wundertusk/services/providers/task_providers/task_list_provider.dart';

class Filters extends StatelessWidget {
  const Filters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _taskListProvider = context.read<TaskListProvider>();
    final tags = context.watch<TagListProvider>().tags;

    return CustomExpansionTile(
      title: AppLocalizations.of(context)!.filters,
      trailing: InkWell(
        onTap: () {
          showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            builder: (_) => const NewTag(),
          );
        },
        child: const CustomIcon(
          customIcon: AppIcons.kIconAdd,
          color: AppColors.kColBase2,
          width: 28.0,
          height: 28.0,
        ),
      ),
      child: Column(
        children: <Widget>[
          ...tags.map((tag) {
            return CustomListTile(
              leading: const CustomIcon(
                customIcon: AppIcons.kIconTag,
                color: AppColors.kColBase1,
                width: 20.0,
                height: 20.0,
              ),
              title: tag.name,
              onTap: () {
                _taskListProvider.setTasks(
                  filter: TaskGroupFilter.tags,
                  groupName: tag.name,
                );
              },
            );
          }),
          CustomListTile(
            leading: const CustomIcon(
              customIcon: AppIcons.kIconSetting,
              color: AppColors.kColBase1,
              width: 20.0,
              height: 20.0,
            ),
            title: AppLocalizations.of(context)!.tagsSettings,
            onTap: () {
              Navigator.pushNamed(
                context,
                RoutePaths.tagsSettingsScreen,
              );
            },
          ),
        ],
      ),
    );
  }
}
