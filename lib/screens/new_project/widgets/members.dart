import 'package:flutter/material.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/resources/app_icons.dart';

class Members extends StatelessWidget {
  const Members({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CustomIcon(
        height: 28,
        width: 28,
        color: AppColors.kColBase2,
        customIcon: AppIcons.kIconUserCircle,
      ),
      title: Text(AppLocalizations.of(context)!.members),
      subtitle: Text(AppLocalizations.of(context)!.membersStatusNone),
      onTap: () {},
    );
  }
}
