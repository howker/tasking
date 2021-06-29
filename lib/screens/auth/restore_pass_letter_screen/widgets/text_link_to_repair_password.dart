import 'package:flutter/material.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:provider/provider.dart';
import 'package:wundertusk/services/providers/auth_providers/providers.dart';

class TextLinkToRepairPassword extends StatelessWidget {
  const TextLinkToRepairPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = context.watch<UserLoginPassProvider>().userEmail;
    return Text(
      '${AppLocalizations.of(context)!.linkToRepearPassword}$email',
      style: AppTextStyles.kSFFootnote.copyWith(
        color: AppColors.kColBase1,
      ),
      textAlign: TextAlign.center,
    );
  }
}
