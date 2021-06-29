import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/auth_providers/sign_in_provider.dart';

class SignInScreenErrorTextWidget extends StatelessWidget {
  const SignInScreenErrorTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorText = context.watch<SignInProvider>().errorText;

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
