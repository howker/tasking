import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';

class SignUpSecondStepTitleWidget extends StatelessWidget {
  const SignUpSecondStepTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.registration,
          style: AppTextStyles.kSFHeadline1.copyWith(
            color: AppColors.kColBase,
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          AppLocalizations.of(context)!.step2,
          style: AppTextStyles.kSFCaption.copyWith(
            color: AppColors.kColDarkGrey,
          ),
        ),
        const SizedBox(height: 32.0),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppLocalizations.of(context)!.fillOwnData,
            style: AppTextStyles.kSFHeadline2.copyWith(
              color: AppColors.kColBase,
            ),
          ),
        ),
      ],
    );
  }
}
