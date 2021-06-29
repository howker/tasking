import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/common_widgets/or_text_widget.dart';
import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/common_widgets/social_networks_auth_widget.dart';
import 'package:wundertusk/repository/user/user_repository.dart';
import 'package:wundertusk/screens/sign_up/sign_up_first_step_screen/sign_up_first_step_screen_widgets.dart';
import 'package:wundertusk/services/providers/auth_providers/sign_up_provider.dart';

class SignUpFirstStepScreen extends StatelessWidget {
  const SignUpFirstStepScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpProvider(
        context.read<UserRepository>(),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              const Align(
                alignment: Alignment.topCenter,
                child: SignUpBackgroundImage(),
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
                            SignUpFirstStepTitleWidget(),
                            SizedBox(height: 16.0),
                            SignUpEmailField(),
                            SizedBox(height: 16.0),
                            SignUpPasswordTextField(),
                            SizedBox(height: 16.0),
                            SignUpConfirmationPasswordTextField(),
                            SignUpFirstStepErrorTextWidget(),
                            SizedBox(height: 16.0),
                            SignUpContinueButton(),
                            SizedBox(height: 16.0),
                            OrTextWidget(),
                            SizedBox(height: 16.0),
                            SocialNetworksAuthWidget(),
                            SizedBox(height: 16.0),
                            AlreadySignedUpTextWidget(),
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
      ),
    );
  }
}
