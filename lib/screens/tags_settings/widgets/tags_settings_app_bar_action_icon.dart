import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/screens/tags_settings/widgets/tags_delete_confirmation_dialog.dart';
import 'package:wundertusk/services/providers/tag_providers/tag_list_provider.dart';
import 'package:wundertusk/screens/tags_settings/tags_settings_screen_provider.dart';

class TagsSettingsAppBarActionIcon extends StatelessWidget {
  const TagsSettingsAppBarActionIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tagListProvider = context.read<TagListProvider>();
    final screenProvider = context.read<TagsSettingsScreenProvider>();
    final screenState = context.watch<TagsSettingsScreenProvider>().screenState;

    Function() resolvedOnPressed;
    String resolvedIconPath;
    Color? resolvedIconColor;

    switch (screenState) {
      case TagsSettingsScreenStates.defaultState:
        resolvedIconPath = AppIcons.kIconAddCircle;
        resolvedOnPressed = () {
          screenProvider.changeState(TagsSettingsScreenStates.addState);
        };
        break;
      case TagsSettingsScreenStates.addState:
        resolvedIconPath = AppIcons.kIconCheckboxCircle;
        resolvedOnPressed = () async {
          await screenProvider.saveNewTag();
          await tagListProvider.fetchTags();
          screenProvider.changeState(TagsSettingsScreenStates.defaultState);
        };
        break;
      case TagsSettingsScreenStates.selectionState:
        resolvedIconPath = AppIcons.kIconDelete;
        resolvedIconColor = AppColors.kColDeleteIcon;
        resolvedOnPressed = () {
          showDialog<void>(
            context: context,
            builder: (_) => ChangeNotifierProvider.value(
              value: context.read<TagsSettingsScreenProvider>(),
              child: const TagsDeleteConfirmationDialog(),
            ),
          );
        };
        break;
    }

    return IconButton(
      onPressed: resolvedOnPressed,
      icon: CustomIcon(
        width: 24.0,
        height: 24.0,
        customIcon: resolvedIconPath,
        color: resolvedIconColor,
      ),
    );
  }
}
