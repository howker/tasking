import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/common_widgets/custom_list_tile.dart';

class TasksListTile extends StatelessWidget {
  final String iconAssetPath;
  final String groupName;
  final int? tasksAmount;
  final Color? iconColor;
  final Color? backgroundColor;
  final Function()? onTap;

  const TasksListTile({
    required this.iconAssetPath,
    required this.groupName,
    this.tasksAmount = 0,
    this.iconColor,
    this.backgroundColor,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      backgroundColor: backgroundColor,
      onTap: onTap,
      leading: CustomIcon(
        customIcon: iconAssetPath,
        width: 20.0,
        height: 20.0,
        color: iconColor,
      ),
      title: groupName,
      titleStyle: AppTextStyles.kSFSubhead,
      trailing: Text(
        '$tasksAmount',
        style: AppTextStyles.kSFFootnote.copyWith(color: AppColors.kColBase2),
      ),
    );
  }
}
