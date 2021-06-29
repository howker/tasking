import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/common_widgets/custom_list_tile.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/screens/tags_settings/widgets/add_tag_text_field.dart';
import 'package:wundertusk/services/providers/tag_providers/tag_list_provider.dart';
import 'package:wundertusk/screens/tags_settings/tags_settings_screen_provider.dart';

class TagsSettingsBodyWidget extends StatelessWidget {
  const TagsSettingsBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tags = context.watch<TagListProvider>().tags;
    final selectedTags =
        context.watch<TagsSettingsScreenProvider>().selectedTags;
    final screenState = context.watch<TagsSettingsScreenProvider>().screenState;
    final screenProvider = context.read<TagsSettingsScreenProvider>();

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const AddTagTextField(),
          Column(
            children: tags.map((tag) {
              return CustomListTile(
                leading: const CustomIcon(
                  customIcon: AppIcons.kIconTag,
                  color: AppColors.kColBase1,
                ),
                title: tag.name,
                backgroundColor: selectedTags.contains(tag)
                    ? AppColors.kColBase4
                    : AppColors.kColBackground,
                onTap: () {
                  if (screenState == TagsSettingsScreenStates.selectionState) {
                    screenProvider.addToOrDeleteFromSelected(tag);
                  }
                  selectedTags.isNotEmpty
                      ? screenProvider.changeState(
                          TagsSettingsScreenStates.selectionState,
                        )
                      : screenProvider.changeState(
                          TagsSettingsScreenStates.defaultState,
                        );
                },
                onLongPress: () {
                  if (screenState == TagsSettingsScreenStates.defaultState) {
                    screenProvider.addToOrDeleteFromSelected(tag);
                  }
                  selectedTags.isNotEmpty
                      ? screenProvider.changeState(
                          TagsSettingsScreenStates.selectionState,
                        )
                      : screenProvider.changeState(
                          TagsSettingsScreenStates.defaultState,
                        );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
