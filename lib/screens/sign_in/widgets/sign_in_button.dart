import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/common_widgets/custom_rounded_button.dart';
import 'package:wundertusk/services/providers/auth_providers/sign_in_provider.dart';
import 'package:wundertusk/services/providers/user_providers/user_provider.dart';

class SignInButton extends StatefulWidget {
  const SignInButton({
    Key? key,
  }) : super(key: key);

  @override
  _SignInButtonState createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  @override
  Widget build(BuildContext context) {
    final _signInProvider = context.read<SignInProvider>();
    final _userProvider = context.read<UserProvider>();

    return CustomRoundedButton(
      onPressed: () async {
        InputUtils.unFocus();

        final isSignedIn = await _signInProvider.signIn();
        if (isSignedIn) {
          await _userProvider.loadUser(_signInProvider.email!);
          if (mounted) {
            await Navigator.pushReplacementNamed(
              context,
              RoutePaths.homeScreen,
            );
          }
        }
      },
      child: Text(
        AppLocalizations.of(context)!.signIn,
        style: AppTextStyles.kSFBodyMedium.copyWith(
          color: AppColors.kColBackground,
        ),
      ),
    );
  }
}
