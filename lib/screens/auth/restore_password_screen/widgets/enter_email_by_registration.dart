import 'package:flutter/material.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/auth_providers/providers.dart';
import 'package:provider/provider.dart';

class EnterEmailByRegistration extends StatelessWidget {
  const EnterEmailByRegistration({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.watch<ErrorStateProvider>().getErrorState
        ? const SizedBox.shrink()
        : Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppLocalizations.of(context)!.enterRegEmail,
              style: AppTextStyles.kSFFootnote.copyWith(
                color: AppColors.kColBase1,
              ),
            ),
          );
  }
}
