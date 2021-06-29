import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/services/providers/auth_providers/providers.dart';

class RestoreRegistrationPasswordFieldConfirm extends StatefulWidget {
  const RestoreRegistrationPasswordFieldConfirm({
    Key? key,
  }) : super(key: key);

  @override
  _RestoreRegistrationPasswordFieldConfirmState createState() =>
      _RestoreRegistrationPasswordFieldConfirmState();
}

class _RestoreRegistrationPasswordFieldConfirmState
    extends State<RestoreRegistrationPasswordFieldConfirm> {
  final textControllerPasswordField = TextEditingController();
  bool hidePassword = true;
  Widget hideIcon = const CustomIcon(customIcon: AppIcons.kIconEye);

  @override
  void initState() {
    super.initState();

    textControllerPasswordField.clear();
  }

  @override
  Widget build(BuildContext context) {
    var passwordForConfirm = '';
    var password = '';

    return TextFormField(
      controller: textControllerPasswordField,
      obscureText: hidePassword,
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
        prefixIconConstraints: const BoxConstraints(maxHeight: 24.0),
        suffixIconConstraints: const BoxConstraints(maxHeight: 24.0),
        labelStyle:
            AppTextStyles.kSFFootnote.copyWith(color: AppColors.kColDarkGrey),
        labelText: AppLocalizations.of(context)!.confirmNewPassword,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 19.0, right: 11.0),
          child: CustomIcon(customIcon: AppIcons.kIconLock),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(left: 19.0, right: 17.0),
          child: InkWell(
            onTap: () {
              setState(() {
                hidePassword = !hidePassword;
                hidePassword
                    ? hideIcon = const CustomIcon(
                        customIcon: AppIcons.kIconEye,
                      )
                    : hideIcon = const CustomIcon(
                        customIcon: AppIcons.kIconCloseEye,
                      );
              });
            },
            child: hideIcon,
          ),
        ),
      ),
      onChanged: (value) {
        password = value;
        _setUserPassword(password);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        passwordForConfirm =
            context.watch<UserLoginPassProvider>().getUserPassword;
        if (value!.isEmpty || value != passwordForConfirm) {
          password = '';
          return '';
        } else {
          password = passwordForConfirm;
          return null;
        }
      },
      onEditingComplete: () {
        if (password != '' && password == textControllerPasswordField.text) {
          context
              .read<UserLoginPassProvider>()
              .setUserPassword(textControllerPasswordField.text);

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
    textControllerPasswordField.dispose();
  }

  void _setUserPassword(String password) {
    context.read<UserLoginPassProvider>().setUserPassword(password);
  }
}
