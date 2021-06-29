import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';

class StyledDivider extends Divider {
  const StyledDivider({
    Color color = AppColors.kColBase2,
    double height = 2.0,
    Key? key,
  }) : super(
          key: key,
          color: color,
          height: height,
        );
}
