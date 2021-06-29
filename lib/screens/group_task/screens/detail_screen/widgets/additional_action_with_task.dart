import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/resources/app_colors.dart';
import 'package:wundertusk/resources/app_icons.dart';
import 'package:wundertusk/resources/app_text_styles.dart';
import 'package:wundertusk/services/providers/task_providers/task_attachments_provider.dart';
import 'package:wundertusk/screens/group_task/screens/detail_screen/widgets/action_icon_button.dart';

class AdditionalActionWithTask extends StatelessWidget {
  final Task task;

  const AdditionalActionWithTask({
    required this.task,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = context.read<TaskAttachmentsProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              AppLocalizations.of(context)!.actionWithTask,
              style: AppTextStyles.kSFHeadline2,
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ActionIconButton(
                  icon: const CustomIcon(
                    customIcon: AppIcons.kIconMicro,
                  ),
                  text: AppLocalizations.of(context)!.record,
                ),
                ActionIconButton(
                  icon: const CustomIcon(
                    customIcon: AppIcons.kIconCamera,
                  ),
                  text: AppLocalizations.of(context)!.photo,
                  onTap: () async {
                    final pickResults = await FilePicker.platform.pickFiles(
                      type: FileType.image,
                      allowMultiple: true,
                    );
                    if (pickResults != null && pickResults.paths.isNotEmpty) {
                      await _provider.saveFilesToTask(pickResults.paths, task);
                    }
                  },
                ),
                ActionIconButton(
                  icon: const CustomIcon(
                    customIcon: AppIcons.kIconFile,
                  ),
                  text: AppLocalizations.of(context)!.file,
                  onTap: () async {
                    final pickResults = await FilePicker.platform.pickFiles(
                      allowMultiple: true,
                    );
                    if (pickResults != null && pickResults.paths.isNotEmpty) {
                      await _provider.saveFilesToTask(pickResults.paths, task);
                    }
                  },
                ),
                ActionIconButton(
                  icon: const CustomIcon(
                    customIcon: AppIcons.kIconTag,
                  ),
                  text: AppLocalizations.of(context)!.tag,
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextButton.icon(
                  onPressed: () {},
                  icon: const CustomIcon(
                    customIcon: AppIcons.kIconArrowCircleRight,
                  ),
                  label: Text(
                    AppLocalizations.of(context)!.moveTask,
                    style: AppTextStyles.kSFBody.copyWith(
                      color: AppColors.kColBase,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const CustomIcon(
                    customIcon: AppIcons.kIconDuplicate,
                  ),
                  label: Text(
                    AppLocalizations.of(context)!.copyTask,
                    style: AppTextStyles.kSFBody.copyWith(
                      color: AppColors.kColBase,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const CustomIcon(
                    customIcon: AppIcons.kIconNotification,
                  ),
                  label: Text(
                    AppLocalizations.of(context)!.copyLink,
                    style: AppTextStyles.kSFBody.copyWith(
                      color: AppColors.kColBase,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const CustomIcon(
                    customIcon: AppIcons.kIconTag,
                  ),
                  label: Text(
                    AppLocalizations.of(context)!.addInFavorites,
                    style: AppTextStyles.kSFBody.copyWith(
                      color: AppColors.kColBase,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const CustomIcon(
                    customIcon: AppIcons.kIconTime,
                  ),
                  label: Text(
                    AppLocalizations.of(context)!.rememberMe,
                    style: AppTextStyles.kSFBody.copyWith(
                      color: AppColors.kColBase,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const CustomIcon(
                    customIcon: AppIcons.kIconRepeat,
                  ),
                  label: Text(
                    AppLocalizations.of(context)!.repeat,
                    style: AppTextStyles.kSFBody.copyWith(
                      color: AppColors.kColBase,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const CustomIcon(
                    customIcon: AppIcons.kIconWarn,
                  ),
                  label: Text(
                    AppLocalizations.of(context)!.setPriority,
                    style: AppTextStyles.kSFBody.copyWith(
                      color: AppColors.kColBase,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const CustomIcon(
                    customIcon: AppIcons.kIconAddSubtask,
                  ),
                  label: Text(
                    AppLocalizations.of(context)!.addSubtask,
                    style: AppTextStyles.kSFBody.copyWith(
                      color: AppColors.kColBase,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    // TODO(mozochek): implement when navigation will be nice
                    // context
                    //     .read<TaskListProvider>()
                    //     .deleteTask(task)
                    //     .then((taskWasDeleted) {
                    //   if (taskWasDeleted) {
                    //     Navigator.popUntil(
                    //       context,
                    //       (route) {
                    //         print('name ${route.settings.name}');
                    //         // return route.settings.name == RoutePaths.homeScreen;
                    //         return false;
                    //       },
                    //     );
                    //   }
                    // });
                  },
                  icon: const CustomIcon(
                    customIcon: AppIcons.kIconDelete,
                    color: Colors.red,
                  ),
                  label: Text(
                    AppLocalizations.of(context)!.deleteTask,
                    style: AppTextStyles.kSFBody.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            Center(
              child: Text(AppLocalizations.of(context)!.tempDate),
            ),
          ],
        ),
      ),
    );
  }
}
