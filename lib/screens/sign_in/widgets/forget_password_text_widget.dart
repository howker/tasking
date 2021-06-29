import 'package:flutter/material.dart';

import 'package:wundertusk/common_widgets/custom_text_button.dart';
import 'package:wundertusk/key_packages.dart';

class ForgetPasswordTextWidget extends StatelessWidget {
  const ForgetPasswordTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '${AppLocalizations.of(context)!.forgotPassword} ',
          style: AppTextStyles.kSFFootnote.copyWith(
            color: AppColors.kColBase1,
          ),
        ),
        CustomTextButton(
          text: AppLocalizations.of(context)!.repairPassword,
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              RoutePaths.restorePasswordScreen,
            );
          },
        ),
      ],
    );
  }
}
