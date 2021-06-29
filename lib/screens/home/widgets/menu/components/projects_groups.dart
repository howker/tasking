import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/group_providers/group_list_provider.dart';
import 'package:wundertusk/screens/home/widgets/custom_expansion_tile.dart';
import 'package:wundertusk/common_widgets/custom_list_tile.dart';
import 'package:wundertusk/services/providers/task_providers/task_list_provider.dart';

class ProjectsGroups extends StatelessWidget {
  const ProjectsGroups({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskListProvider = context.read<TaskListProvider>();
    final groupList = context.watch<GroupListProvider>().groups;

    return CustomExpansionTile(
      title: AppLocalizations.of(context)!.projects,
      trailing: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            RoutePaths.newProjectScreen,
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
          Column(
            children: groupList.map((group) {
              return CustomListTile(
                leading: const CustomIcon(
                  customIcon: AppIcons.kIconExplore,
                  color: AppColors.kColAccent2,
                  width: 20.0,
                  height: 20.0,
                ),
                title: group.groupName,
                onTap: () {
                  taskListProvider.setTasks(
                    filter: TaskGroupFilter.projects,
                    groupName: group.groupName,
                    groupId: group.id,
                  );
                },
              );
            }).toList(),
          ),
          CustomListTile(
            leading: const CustomIcon(
              customIcon: AppIcons.kIconAddCircle,
              color: AppColors.kColAccent2,
              width: 20.0,
              height: 20.0,
            ),
            title: AppLocalizations.of(context)!.createProject,
            titleStyle: AppTextStyles.kSFFootnote.copyWith(
              color: AppColors.kColAccent2,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
