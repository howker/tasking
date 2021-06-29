import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/auth_providers/sign_in_provider.dart';

class SignInPasswordTextField extends StatefulWidget {
  const SignInPasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  _SignInPasswordTextFieldState createState() =>
      _SignInPasswordTextFieldState();
}

class _SignInPasswordTextFieldState extends State<SignInPasswordTextField> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    final _provider = context.read<SignInProvider>();

    return TextFormField(
      obscureText: _hidePassword,
      style: AppTextStyles.kSFFootnote.copyWith(color: AppColors.kColBase),
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.enterPassword,
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
      onChanged: _provider.setPassword,
    );
  }
}
