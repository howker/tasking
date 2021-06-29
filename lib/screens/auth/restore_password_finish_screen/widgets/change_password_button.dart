import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/repository/user/user_repository.dart';
import 'package:wundertusk/services/providers/auth_providers/providers.dart';

class ChangePasswordButton extends StatefulWidget {
  final String secret;

  const ChangePasswordButton({
    required this.secret,
    Key? key,
  }) : super(key: key);

  @override
  _ChangePasswordButtonState createState() => _ChangePasswordButtonState();
}

class _ChangePasswordButtonState extends State<ChangePasswordButton> {
  @override
  Widget build(BuildContext context) {
    final password = context.watch<UserLoginPassProvider>().getUserPassword;

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
        final isSuccess = await context
            .read<UserRepository>()
            .sendNewPassword(password: password, secret: widget.secret);

        if (isSuccess) {
          if (mounted) {
            context.read<ErrorStateProvider>().setNoErrorState();
            await Navigator.pushReplacementNamed(
              context,
              RoutePaths.loginScreen,
            );
          }
        }
      },
      child: Text(
        AppLocalizations.of(context)!.changePassword,
        style: AppTextStyles.kSFBodyMedium.copyWith(
          color: AppColors.kColBackground,
        ),
      ),
    );
  }
}
