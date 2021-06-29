import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/repository/user/user_repository.dart';
import 'package:wundertusk/services/providers/auth_providers/providers.dart';

class RestoreButton extends StatefulWidget {
  const RestoreButton({
    Key? key,
  }) : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<RestoreButton> {
  @override
  Widget build(BuildContext context) {
    final email = context.watch<UserLoginPassProvider>().userEmail;
    String? secret = '';

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: AppColors.kColAccentNormal,
        minimumSize: const Size.fromHeight(48.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45.0),
        ),
      ),
      onPressed: () async {
        InputUtils.unFocus();
        var isSuccess = false;
        if (email == '') {
          isSuccess = false;
          context.read<ErrorStateProvider>().setErrorState();
        }

        if (email != '') {
          secret = await context.read<UserRepository>().sendEmail(email: email);
          if (secret != null) isSuccess = true;
        }
        if (!isSuccess) {
          if (mounted) {
            context.read<ErrorStateProvider>().setErrorState();
            await Navigator.pushReplacementNamed(
              context,
              RoutePaths.restorePasswordScreen,
            );
          }
        }
        if (isSuccess) {
          if (mounted) {
            context.read<ErrorStateProvider>().setNoErrorState();
            await Navigator.pushReplacementNamed(
              context,
              RoutePaths.restorePasswordFinishScreen,
              arguments: secret,
            );
          }
        }
      },
      child: Text(
        AppLocalizations.of(context)!.restorePassword,
        style: AppTextStyles.kSFBodyMedium.copyWith(
          color: AppColors.kColBackground,
        ),
      ),
    );
  }
}
