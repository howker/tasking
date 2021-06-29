import 'package:flutter/material.dart';

import 'package:wundertusk/screens/sign_up/sign_up_second_step_screen/sign_up_second_step_screen_widgets.dart';

class SignUpSecondStepScreen extends StatelessWidget {
  const SignUpSecondStepScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (_, constraints) {
            return ConstrainedBox(
              constraints: constraints.copyWith(
                minHeight: constraints.maxHeight,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: IntrinsicHeight(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: const <Widget>[
                              SizedBox(height: 32.0),
                              SignUpSecondStepTitleWidget(),
                              SizedBox(height: 24.0),
                              SignUpNameTextField(),
                              SizedBox(height: 16.0),
                              SignUpSurnameTextField(),
                            ],
                          ),
                        ),
                        const Expanded(
                          child: SizedBox.shrink(),
                        ),
                        Column(
                          children: const <Widget>[
                            SignUpButton(),
                            SizedBox(height: 32.0),
                            SignUpConfidentialityTermsWidget(),
                            SizedBox(height: 32.0),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
