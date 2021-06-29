import 'package:flutter/material.dart';
import 'package:wundertusk/common_widgets/custom_list_tile.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/models/group.dart';
import 'package:wundertusk/screens/select_project_qr/select_project_qr_widgets.dart';

class ProjectsViewWidget extends StatelessWidget {
  final List<Group> _groupList;

  const ProjectsViewWidget({
    required List<Group> groupList,
    Key? key,
  })  : _groupList = groupList,
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _groupList.length,
      itemBuilder: (context, index) {
        return CustomExpansionTileWidget(
          leading: const CustomIcon(
            customIcon: AppIcons.kIconExplore,
            color: AppColors.kColAccent2,
            width: 20.0,
            height: 20.0,
          ),
          title: _groupList[index].groupName,
          titleStyle: AppTextStyles.kSFFootnote,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              children: const <Widget>[
                CustomListTile(
                  leading: CustomIcon(
                    customIcon: AppIcons.kIconList,
                    color: AppColors.kColAccent3,
                    width: 20.0,
                    height: 20.0,
                  ),
                  title: 'Лесной ресурс',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
