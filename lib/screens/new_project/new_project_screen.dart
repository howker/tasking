import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/resources/app_colors.dart';
import 'package:wundertusk/resources/app_icons.dart';
import 'package:wundertusk/services/providers/group_providers/group_list_provider.dart';
import 'package:wundertusk/screens/new_project/new_project_screen_widgets.dart';

class NewProjectScreen extends StatelessWidget {
  const NewProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: AppColors.kColBase1,
          icon: const CustomIcon(
            customIcon: AppIcons.kIconArrowBack,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          AppLocalizations.of(context)!.addProject,
          style: AppTextStyles.kSFHeadline2.copyWith(
            color: AppColors.kColBase,
          ),
        ),
        actions: [
          IconButton(
            icon: const CustomIcon(
              customIcon: AppIcons.kIconSend,
            ),
            onPressed: () {
              final _groupProvider = context.read<GroupListProvider>();
              final _groupName = _groupProvider.groupNameController.text;
              if (_groupName.isNotEmpty) {
                _groupProvider.createGroup(name: _groupName);
              }
              _groupProvider.groupNameController.clear();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 0.0),
        child: Column(
          children: const <Widget>[
            ProjectTitle(),
            Members(),
            Favorites(),
          ],
        ),
      ),
    );
  }
}
