import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';

class SignUpFirstStepTitleWidget extends StatelessWidget {
  const SignUpFirstStepTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.registration,
      style: AppTextStyles.kSFHeadline1.copyWith(
        color: AppColors.kColBase,
      ),
    );
  }
}
