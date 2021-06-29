import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/screens/tags_settings/tags_settings_screen_provider.dart';

class TagsSettingsAppBarTitle extends StatelessWidget {
  const TagsSettingsAppBarTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenState = context.watch<TagsSettingsScreenProvider>().screenState;

    String resolvedScreenTitle;

    switch (screenState) {
      case TagsSettingsScreenStates.defaultState:
      case TagsSettingsScreenStates.addState:
        resolvedScreenTitle = AppLocalizations.of(context)!.tagsSettings;
        break;
      case TagsSettingsScreenStates.selectionState:
        resolvedScreenTitle = context
            .read<TagsSettingsScreenProvider>()
            .selectedTags
            .length
            .toString();
        break;
    }

    return Text(
      resolvedScreenTitle,
      style: AppTextStyles.kSFHeadline2.copyWith(color: AppColors.kColBase),
    );
  }
}
