import 'package:flutter/material.dart';

class RestorePasswordFinishScreenImage extends StatelessWidget {
  const RestorePasswordFinishScreenImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 1.65,
        ),
        child: Image.asset(
          'assets/images/collaboration2.png',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
