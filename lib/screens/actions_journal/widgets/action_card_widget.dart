import 'package:flutter/material.dart';
import 'package:wundertusk/key_packages.dart';

class ActionCardWidget extends StatelessWidget {
  final String avatarPath;
  final String action;
  final String time;
  final String projectName;

  const ActionCardWidget({
    required this.action,
    required this.time,
    required this.projectName,
    this.avatarPath = 'assets/images/avatar3.png',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CircleAvatar(
                    backgroundImage: Image.asset(avatarPath).image,
                    radius: 18,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    action,
                    style: AppTextStyles.kSFBody14.copyWith(
                      color: AppColors.kColBase,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        time,
                        style: AppTextStyles.kSFCaption.copyWith(
                          color: AppColors.kColBase2,
                        ),
                      ),
                      Text(
                        projectName,
                        style: AppTextStyles.kSFCaption.copyWith(
                          color: AppColors.kColBase2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const Divider(color: AppColors.kColDivider),
      ],
    );
  }
}
