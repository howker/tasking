import 'package:flutter/material.dart';
import 'package:wundertusk/key_packages.dart';

class AnimatedLogoWidget extends StatefulWidget {
  const AnimatedLogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedLogoWidgetState createState() => _AnimatedLogoWidgetState();
}

class _AnimatedLogoWidgetState extends State<AnimatedLogoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      })
      ..forward();

    scaleAnimation = Tween<double>(
      begin: 0.75,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, child) {
        return SizedBox(
          width: 75 + scaleAnimation.value * 100,
          height: 75 + scaleAnimation.value * 100,
          child: child,
        );
      },
      child: const CustomIcon(
        customIcon: AppIcons.kIconLogo,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }
}
