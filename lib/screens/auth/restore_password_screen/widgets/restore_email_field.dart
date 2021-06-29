import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/auth_providers/providers.dart';

class RestoreEmailField extends StatefulWidget {
  const RestoreEmailField({
    Key? key,
  }) : super(key: key);

  @override
  _AuthorizationEmailFieldState createState() =>
      _AuthorizationEmailFieldState();
}

class _AuthorizationEmailFieldState extends State<RestoreEmailField> {
  final textControllerEmailField = TextEditingController();

  @override
  void initState() {
    super.initState();

    textControllerEmailField.clear();
  }

  @override
  Widget build(BuildContext context) {
    var email = '';

    return TextFormField(
      controller: textControllerEmailField,
      showCursor: false,
      style: AppTextStyles.kSFFootnote.copyWith(color: AppColors.kColBase),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.go,
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: const EdgeInsets.all(12.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kColBase3),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.kColPurple),
        ),
        prefixIconConstraints: const BoxConstraints(maxHeight: 24),
        labelStyle:
            AppTextStyles.kSFFootnote.copyWith(color: AppColors.kColDarkGrey),
        labelText: AppLocalizations.of(context)!.enterEmail,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 19.0, right: 11.0),
          child: CustomIcon(customIcon: AppIcons.kIconPost),
        ),
      ),
      onChanged: (value) {
        email = value;
        _setUserEmail(email);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        const pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        final regex = RegExp(pattern);
        if (!regex.hasMatch(value!)) {
          email = '';
          return '';
        }
      },
      onEditingComplete: () {
        if (email != '') {
          context
              .read<UserLoginPassProvider>()
              .setUserEmail(textControllerEmailField.text);
          FocusScope.of(context).requestFocus(FocusNode());
        } else {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    textControllerEmailField.dispose();
  }

  void _setUserEmail(String email) {
    context.read<UserLoginPassProvider>().setUserEmail(email);
  }
}
