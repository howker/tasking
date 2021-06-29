import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpBackgroundImage extends StatelessWidget {
  const SignUpBackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/sign_up_screen_image.svg');
  }
}
