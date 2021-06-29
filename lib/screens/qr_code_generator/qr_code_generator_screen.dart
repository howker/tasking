import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/common_widgets/allow_users_check_box.dart';
import 'package:wundertusk/screens/qr_code_generator/qr_code_generator_screen_widgets.dart';

class QRCodeGeneratorScreen extends StatelessWidget {
  final String qrData;

  const QRCodeGeneratorScreen({
    required this.qrData,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomQrBottom(),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.setTask,
          style: AppTextStyles.kSFHeadline2.copyWith(
            color: AppColors.kColBase,
          ),
        ),
        // automaticallyImplyLeading: false,
        // title: TextButton.icon(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   label: Text(
        //     AppLocalizations.of(context)!.setTask,
        //     style: AppTextStyles.kSFHeadline2.copyWith(
        //       color: AppColors.kColBase,
        //     ),
        //   ),
        // ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 51),
              QRImageWidget(
                qrData: qrData,
              ),
              const SizedBox(height: 54),
              const Folder(),
              const SizedBox(height: 18),
              AllowUsersCheckBox(
                text: AppLocalizations.of(context)!.allowUsers,
                textStyle: AppTextStyles.kSFFootnote,
                textColor: AppColors.kColBase,
                borderColor: AppColors.kColBase,
                boxWidth: 13,
                boxHeight: 13,
                scale: 0.5,
                checkBoxCheckColor: AppColors.kColBase,
              ),
              const Spacer(),
              Text(
                AppLocalizations.of(context)!.howToAddTask,
                style: AppTextStyles.kSFSubhead.copyWith(
                  color: AppColors.kColBase1,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
