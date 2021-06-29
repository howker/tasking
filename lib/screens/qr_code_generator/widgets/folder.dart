import 'package:flutter/material.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/screens/select_project_qr/select_project_qr_screen.dart';

class Folder extends StatelessWidget {
  const Folder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 40,
        width: 216,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: AppColors.kBGAccent2,
        ),
        child: TextButton.icon(
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              builder: (_) => const SelectProjectQrScreen(),
            );
          },
          icon: const CustomIcon(
            customIcon: AppIcons.kIconFolderNotch,
            color: AppColors.kColAccent2,
          ),
          label: Text(
            AppLocalizations.of(context)!.titleMinus,
            style: AppTextStyles.kSFSubhead.copyWith(
              color: AppColors.kColAccent2,
            ),
          ),
        ),
      ),
    );
  }
}
