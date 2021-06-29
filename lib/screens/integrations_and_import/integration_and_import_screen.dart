import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/common_widgets/custom_list_tile.dart';

class IntegrationAndImportScreen extends StatelessWidget {
  const IntegrationAndImportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const CustomIcon(
            customIcon: AppIcons.kIconArrowBack,
            color: AppColors.kColBase,
          ),
          label: Text(
            AppLocalizations.of(context)!.integrationsAndImport,
            style: AppTextStyles.kSFHeadline2.copyWith(
              color: AppColors.kColBase,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  AppLocalizations.of(context)!.import,
                  style: AppTextStyles.kSFSubhead.copyWith(
                    color: AppColors.kColBase,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              CustomListTile(
                leading: const CustomIcon(
                  customIcon: AppIcons.kIconTodoList,
                  color: AppColors.kColToDoIstIcon,
                  width: 20.0,
                  height: 20.0,
                ),
                title: AppLocalizations.of(context)!.todoIst,
                titleStyle: AppTextStyles.kSFBody.copyWith(
                  color: AppColors.kColBase,
                ),
              ),
              const Divider(color: AppColors.kColDivider),
              CustomListTile(
                leading: Image.asset(
                  'assets/images/any_do.png',
                ),
                title: AppLocalizations.of(context)!.anyDo,
                titleStyle: AppTextStyles.kSFBody.copyWith(
                  color: AppColors.kColBase,
                ),
              ),
              const Divider(color: AppColors.kColDivider),
              CustomListTile(
                leading: Image.asset(
                  'assets/images/google_g.png',
                ),
                title: AppLocalizations.of(context)!.googleCalendar,
                titleStyle: AppTextStyles.kSFBody.copyWith(
                  color: AppColors.kColBase,
                ),
              ),
              const Divider(color: AppColors.kColDivider),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  AppLocalizations.of(context)!.integration,
                  style: AppTextStyles.kSFSubhead.copyWith(
                    color: AppColors.kColBase,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              CustomListTile(
                leading: const CustomIcon(
                  customIcon: AppIcons.kIconGoogleVoice,
                  width: 20.0,
                  height: 20.0,
                ),
                title: AppLocalizations.of(context)!.googleAssistant,
                titleStyle: AppTextStyles.kSFBody.copyWith(
                  color: AppColors.kColBase,
                ),
              ),
              const Divider(color: AppColors.kColDivider),
              CustomListTile(
                leading: const CustomIcon(
                  customIcon: AppIcons.kIconZapier,
                  width: 20.0,
                  height: 20.0,
                ),
                title: AppLocalizations.of(context)!.zapierPlus,
                titleStyle: AppTextStyles.kSFBody.copyWith(
                  color: AppColors.kColBase,
                ),
              ),
              const Divider(color: AppColors.kColDivider),
              CustomListTile(
                leading: Image.asset(
                  'assets/images/amazon.png',
                ),
                title: AppLocalizations.of(context)!.amazonAlexa,
                titleStyle: AppTextStyles.kSFBody.copyWith(
                  color: AppColors.kColBase,
                ),
              ),
              const Divider(color: AppColors.kColDivider),
              CustomListTile(
                leading: Image.asset(
                  'assets/images/ift.png',
                ),
                title: AppLocalizations.of(context)!.ifttt,
                titleStyle: AppTextStyles.kSFBody.copyWith(
                  color: AppColors.kColBase,
                ),
              ),
              const Divider(color: AppColors.kColDivider),
              CustomListTile(
                leading: const CustomIcon(
                  customIcon: AppIcons.kIconIntegration,
                  width: 20.0,
                  height: 20.0,
                ),
                title: AppLocalizations.of(context)!.title,
                titleStyle: AppTextStyles.kSFBody.copyWith(
                  color: AppColors.kColBase,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
