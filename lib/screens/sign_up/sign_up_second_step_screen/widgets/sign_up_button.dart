import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/common_widgets/custom_rounded_button.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/messages/ui_messages.dart';
import 'package:wundertusk/services/providers/auth_providers/sign_up_provider.dart';

class SignUpButton extends StatefulWidget {
  const SignUpButton({
    Key? key,
  }) : super(key: key);

  @override
  _SignUpButtonState createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  @override
  Widget build(BuildContext context) {
    return CustomRoundedButton(
      onPressed: () async {
        InputUtils.unFocus();
        final userWasSignedUp = await context.read<SignUpProvider>().signUp();
        if (userWasSignedUp) {
          await UIMessages.showSimpleToast('Пользователь успешно зарегестрирован!');
          if (mounted) {
            await Navigator.pushReplacementNamed(
              context,
              RoutePaths.loginScreen,
            );
          }
        }
      },
      child: Text(
        AppLocalizations.of(context)!.finishRegistration,
        style: AppTextStyles.kSFBodyMedium.copyWith(
          color: AppColors.kColBackground,
        ),
      ),
    );
  }
}
