import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/resources/app_colors.dart';
import 'package:wundertusk/resources/app_text_styles.dart';
import 'package:wundertusk/services/providers/auth_providers/sign_up_provider.dart';

class SignUpFirstStepErrorTextWidget extends StatelessWidget {
  const SignUpFirstStepErrorTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorText = context.watch<SignUpProvider>().errorText;


    if (errorText != null) {
      return Column(
        children: <Widget>[
          const SizedBox(height: 8.0),
          Text(
            errorText,
            textAlign: TextAlign.center,
            style: AppTextStyles.text_14Regular.copyWith(
              color: AppColors.kColNotFailed,
            ),
          ),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}