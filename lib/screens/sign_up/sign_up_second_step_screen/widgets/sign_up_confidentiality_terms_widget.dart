import 'package:flutter/material.dart';

import 'package:wundertusk/common_widgets/custom_text_button.dart';
import 'package:wundertusk/key_packages.dart';

class SignUpConfidentialityTermsWidget extends StatelessWidget {
  const SignUpConfidentialityTermsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.agree,
          style: AppTextStyles.kSFFootnote.copyWith(color: AppColors.kColBase1),
        ),
        CustomTextButton(
          text: AppLocalizations.of(context)!.rules,
          onPressed: () {},
        ),
      ],
    );
  }
}
