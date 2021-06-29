import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/common_widgets/custom_list_tile.dart';

class CreateListTile extends StatelessWidget {
  final Color color;

  const CreateListTile({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      leading: CustomIcon(
        customIcon: AppIcons.kIconAddCircle,
        width: 20.0,
        height: 20.0,
        color: color,
      ),
      title: AppLocalizations.of(context)!.createList,
      titleStyle: AppTextStyles.kSFFootnote.copyWith(color: color),
    );
  }
}
