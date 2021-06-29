import 'package:flutter/material.dart';
import 'package:wundertusk/key_packages.dart';

class CustomQrBottom extends StatelessWidget {
  const CustomQrBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kColBackground,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: AppColors.kColAccentNormal,
            minimumSize: const Size.fromHeight(48.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(45.0),
            ),
          ),
          onPressed: () async {},
          child: Text(
            AppLocalizations.of(context)!.toShare,
            style: AppTextStyles.kSFBodyMedium.copyWith(
              color: AppColors.kColBackground,
            ),
          ),
        ),
      ),
    );
  }
}
