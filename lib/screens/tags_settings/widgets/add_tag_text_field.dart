import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/resources/app_colors.dart';
import 'package:wundertusk/resources/app_icons.dart';
import 'package:wundertusk/screens/tags_settings/tags_settings_screen_provider.dart';

class AddTagTextField extends StatelessWidget {
  const AddTagTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenProvider = context.read<TagsSettingsScreenProvider>();
    final _screenState =
        context.watch<TagsSettingsScreenProvider>().screenState;

    if (_screenState == TagsSettingsScreenStates.addState) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: <Widget>[
            const CustomIcon(
              customIcon: AppIcons.kIconTag,
              color: AppColors.kColBase1,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: TextFormField(
                autofocus: true,
                onChanged: _screenProvider.setNewTagName,
                cursorColor: AppColors.kColBase2,
                decoration: const InputDecoration(
                  isCollapsed: true,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
