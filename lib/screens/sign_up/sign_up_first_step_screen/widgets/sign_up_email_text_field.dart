import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/auth_providers/sign_up_provider.dart';

class SignUpEmailField extends StatelessWidget {
  const SignUpEmailField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = context.read<SignUpProvider>();

    return TextFormField(
      style: AppTextStyles.kSFFootnote.copyWith(color: AppColors.kColBase),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.enterEmail,
        isCollapsed: Theme.of(context).inputDecorationTheme.isCollapsed,
        contentPadding: const EdgeInsets.all(12.0),
        prefixIcon: const Padding(
          padding: EdgeInsets.fromLTRB(16.0, 12.0, 8.0, 12.0),
          child: CustomIcon(customIcon: AppIcons.kIconPost),
        ),
      ),
      onChanged: _provider.setEmail,
    );
  }
}
