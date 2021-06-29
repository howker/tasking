import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';

class SignInTitleWidget extends StatelessWidget {
  const SignInTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.signInScreenTitle,
          style: AppTextStyles.kSFHeadline1.copyWith(color: AppColors.kColBase),
        ),
      ],
    );
  }
}
