import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';

class RecordWidget extends StatelessWidget {
  const RecordWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.kColBase3,
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              const Flexible(
                child: CustomIcon(customIcon: AppIcons.kIconPlay),
              ),
              Flexible(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Image.asset(
                      'assets/images/audio.png',
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.kColBGAccentButton,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    'Aa',
                    style: TextStyle(
                      color: AppColors.kColAccent2,
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
