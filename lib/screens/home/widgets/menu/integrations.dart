import 'package:flutter/material.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/common_widgets/custom_list_tile.dart';

class Integrations extends StatelessWidget {
  const Integrations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomListTile(
          title: AppLocalizations.of(context)!.integrations,
          titleStyle: AppTextStyles.kSFSubhead,
          trailing: InkWell(
            onTap: () {},
            child: const CustomIcon(
              customIcon: AppIcons.kIconAdd,
              color: AppColors.kColBase2,
              width: 28.0,
              height: 28.0,
            ),
          ),
        ),
        CustomListTile(
          leading: const CustomIcon(
            customIcon: AppIcons.kIconZapier,
            color: AppColors.kColZapierIcon,
            width: 20.0,
            height: 20.0,
          ),
          title: AppLocalizations.of(context)!.zapier,
        ),
        CustomListTile(
          leading: const CustomIcon(
            customIcon: AppIcons.kIconIntegration,
            color: AppColors.kColAccentNormal,
            width: 20.0,
            height: 20.0,
          ),
          title: AppLocalizations.of(context)!.title,
        ),
        CustomListTile(
          leading: const CustomIcon(
            customIcon: AppIcons.kIconSetting,
            color: AppColors.kColBase1,
            width: 20.0,
            height: 20.0,
          ),
          title: AppLocalizations.of(context)!.inegrationSettings,
          onTap: () {
            Navigator.pushNamed(
              context,
              RoutePaths.integrationAndImportScreen,
            );
          },
        ),
      ],
    );
  }
}
