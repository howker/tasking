import 'package:flutter/material.dart';

import 'package:wundertusk/common_widgets/or_text_widget.dart';
import 'package:wundertusk/common_widgets/social_networks_auth_widget.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/screens/sign_in/sign_in_screen_widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            const Align(
              alignment: Alignment.topCenter,
              child: SignInScreenImage(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(32.0),
                ),
                child: Container(
                  color: AppColors.kColBackground,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          SignInTitleWidget(),
                          SizedBox(height: 16.0),
                          SignInEmailTextField(),
                          SizedBox(height: 16.0),
                          SignInPasswordTextField(),
                          SignInScreenErrorTextWidget(),
                          SizedBox(height: 16.0),
                          ForgetPasswordTextWidget(),
                          SizedBox(height: 16.0),
                          SignInButton(),
                          SizedBox(height: 16.0),
                          OrTextWidget(),
                          SizedBox(height: 16.0),
                          SocialNetworksAuthWidget(),
                          SizedBox(height: 16.0),
                          DoNotHaveAnAccountTextWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
