import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/common_widgets/custom_text_button.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/auth_providers/providers.dart';

class DoNotHaveAnAccountTextWidget extends StatelessWidget {
  const DoNotHaveAnAccountTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          '${AppLocalizations.of(context)!.doNotHaveAnAccount} ',
          style: AppTextStyles.kSFFootnote.copyWith(
            color: AppColors.kColBase1,
          ),
        ),
        CustomTextButton(
          text: AppLocalizations.of(context)!.signUp,
          onPressed: () {
            context.read<ErrorStateProvider>().setNoErrorState();
            Navigator.pushReplacementNamed(
              context,
              RoutePaths.signUp1Screen,
            );
          },
        ),
      ],
    );
  }
}
