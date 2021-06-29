import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/auth_providers/sign_up_provider.dart';

class SignUpConfirmationPasswordTextField extends StatefulWidget {
  const SignUpConfirmationPasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  _AuthorizationPasswordFieldState createState() =>
      _AuthorizationPasswordFieldState();
}

class _AuthorizationPasswordFieldState
    extends State<SignUpConfirmationPasswordTextField> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final _provider = context.read<SignUpProvider>();

    return TextFormField(
      obscureText: _hidePassword,
      style: AppTextStyles.kSFFootnote.copyWith(color: AppColors.kColBase),
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.confirmPassword,
        isCollapsed: Theme.of(context).inputDecorationTheme.isCollapsed,
        contentPadding: const EdgeInsets.all(12.0),
        prefixIcon: const Padding(
          padding: EdgeInsets.fromLTRB(16.0, 12.0, 8.0, 12.0),
          child: CustomIcon(customIcon: AppIcons.kIconLock),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: InkWell(
            onTap: () {
              setState(() {
                _hidePassword = !_hidePassword;
              });
            },
            child: CustomIcon(
              customIcon:
                  _hidePassword ? AppIcons.kIconEye : AppIcons.kIconCloseEye,
            ),
          ),
        ),
      ),
      onChanged: _provider.setConfirmationPassword,
    );
  }
}
