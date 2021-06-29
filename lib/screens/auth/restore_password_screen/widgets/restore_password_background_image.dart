import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/services/providers/auth_providers/providers.dart';

class RestorePasswordBackgroundImage extends StatelessWidget {
  const RestorePasswordBackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorState = context.watch<ErrorStateProvider>().getErrorState;

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(
          width: double.infinity,
          height: errorState
              ? MediaQuery.of(context).size.height / 1.86
              : MediaQuery.of(context).size.height / 1.2,
        ),
        child: errorState
            ? Image.asset(
                'assets/images/searching.png',
                fit: BoxFit.fitHeight,
              )
            : Image.asset(
                'assets/images/newsletter.png',
                fit: BoxFit.fitWidth,
              ),
      ),
    );
  }
}
