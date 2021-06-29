import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/auth_providers/sign_up_provider.dart';

class SignUpNameTextField extends StatelessWidget {
  const SignUpNameTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = context.read<SignUpProvider>();

    return TextFormField(
      style: AppTextStyles.kSFFootnote.copyWith(color: AppColors.kColBase),
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        isCollapsed: Theme.of(context).inputDecorationTheme.isCollapsed,
        contentPadding: const EdgeInsets.all(12.0),
        labelText: AppLocalizations.of(context)!.name,
      ),
      onChanged: _provider.setName,
    );
  }
}
