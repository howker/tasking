import 'package:flutter/material.dart';

import 'package:wundertusk/common_widgets/custom_text_button.dart';
import 'package:wundertusk/key_packages.dart';

class AlreadySignedUpTextWidget extends StatelessWidget {
  const AlreadySignedUpTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '${AppLocalizations.of(context)!.alreadySignedUp} ',
          style: AppTextStyles.kSFFootnote.copyWith(
            color: AppColors.kColBase1,
          ),
        ),
        CustomTextButton(
          text: AppLocalizations.of(context)!.signIn,
          onPressed: () {
            Navigator.pushReplacementNamed(context, RoutePaths.loginScreen);
          },
        ),
      ],
    );
  }
}
