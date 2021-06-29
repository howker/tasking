import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/screens/select_project_qr/select_project_qr_widgets.dart';
import 'package:wundertusk/services/providers/group_providers/group_list_provider.dart';

class SelectProjectQrScreen extends StatelessWidget {
  const SelectProjectQrScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _groupList = context.watch<GroupListProvider>().groups;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 26, bottom: 20),
            child: Text(
              AppLocalizations.of(context)!.projectTitle,
              style: AppTextStyles.kSFBodyMedium.copyWith(
                color: AppColors.kColBase,
              ),
            ),
          ),
        ),
        CustomExpansionTileWidget(
          leading: const CustomIcon(
            customIcon: AppIcons.kIconTray,
            color: AppColors.kColAccent2,
            width: 20.0,
            height: 20.0,
          ),
          title: AppLocalizations.of(context)!.allMyTasks,
          titleStyle: AppTextStyles.kSFFootnote,
          child: const SizedBox.shrink(),
        ),
        ProjectsViewWidget(groupList: _groupList),
      ],
    );
  }
}
