import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/common_widgets/custom_rounded_button.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/auth_providers/sign_up_provider.dart';

class SignUpContinueButton extends StatefulWidget {
  const SignUpContinueButton({
    Key? key,
  }) : super(key: key);

  @override
  _SignUpContinueButtonState createState() => _SignUpContinueButtonState();
}

class _SignUpContinueButtonState extends State<SignUpContinueButton> {
  @override
  Widget build(BuildContext context) {
    // final errorState = context.watch<ErrorStateProvider>().getErrorState;
    // final email = context.watch<UserLoginPassProvider>().userEmail;
    // final password = context.watch<UserLoginPassProvider>().userPassword;

    return CustomRoundedButton(
      onPressed: () async {
        InputUtils.unFocus();
        final _provider = context.read<SignUpProvider>();
        final authDataValid = await _provider.validateAuthData();

        if (authDataValid) {
          if (mounted) {
            await Navigator.pushNamed(
              context,
              RoutePaths.signUp2Screen,
              arguments: _provider,
            );
          }
        }
      },
      child: Text(
        AppLocalizations.of(context)!.continueRegistration,
        style: AppTextStyles.kSFBodyMedium.copyWith(
          color: AppColors.kColBackground,
        ),
      ),
    );
    // return ElevatedButton(
    //   style: ElevatedButton.styleFrom(
    //     primary: AppColors.kColAccentNormal,
    //     minimumSize: const Size.fromHeight(48.0),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(4.0),
    //     ),
    //   ),
    //   onPressed: () {
    //     InputUtils.unFocus();
    //     if (!errorState && email != '' && password != '') {
    //       Navigator.pushNamed(context, RoutePaths.signUp2Screen);
    //     }
    //   },
    //   child: Text(
    //     AppLocalizations.of(context)!.continueRegistration,
    //     style: AppTextStyles.kSFBodyMedium.copyWith(
    //       color: AppColors.kColBackground,
    //     ),
    //   ),
    // );
  }
}
