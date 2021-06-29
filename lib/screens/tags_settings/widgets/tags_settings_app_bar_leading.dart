import 'package:flutter/material.dart';

import 'package:wundertusk/resources/app_colors.dart';
import 'package:wundertusk/resources/app_icons.dart';

class TagsSettingsAppBarLeading extends StatelessWidget {
  const TagsSettingsAppBarLeading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: AppColors.kColBase1,
      icon: const CustomIcon(
        customIcon: AppIcons.kIconArrowBack,
      ),
      onPressed: () {
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      },
    );
  }
}
