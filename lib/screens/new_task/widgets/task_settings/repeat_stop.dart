import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:wundertusk/key_packages.dart';

enum RepeatMode { byDate, after, never }

class RepeatStop extends StatefulWidget {
  const RepeatStop({
    Key? key,
  }) : super(key: key);

  @override
  _RepeatStopState createState() => _RepeatStopState();
}

class _RepeatStopState extends State<RepeatStop> {
  final DateTime date = DateTime.now();
  final int _repeatCount = 0;

  RepeatMode? _groupRepeatMode = RepeatMode.never;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Radio<RepeatMode>(
              groupValue: _groupRepeatMode,
              value: RepeatMode.byDate,
              onChanged: (value) {
                setState(() {
                  _groupRepeatMode = value;
                });
              },
              activeColor: AppColors.kColAccentNormal,
            ),
            Text(
              AppLocalizations.of(context)!.repeatByDate,
              style: AppTextStyles.kSFFootnoteAndSubhead,
            ),
            Container(
              margin: const EdgeInsets.only(left: 16.0),
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(color: AppColors.kColBase3, width: 2.0),
              ),
              child: Text(
                DateFormat('dd MMM yyyy', 'ru_RU').format(date),
                style: AppTextStyles.kSFBody14.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.kColBase,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Row(
          children: [
            Radio<RepeatMode>(
              groupValue: _groupRepeatMode,
              value: RepeatMode.after,
              onChanged: (value) {
                setState(() {
                  _groupRepeatMode = value;
                });
              },
              activeColor: AppColors.kColAccentNormal,
            ),
            Text(
              AppLocalizations.of(context)!.repeatAfter,
              style: AppTextStyles.kSFFootnoteAndSubhead,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 28.0, right: 16.0),
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: AppColors.kColBase3, width: 2.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$_repeatCount',
                      style: AppTextStyles.kSFBody14.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.kColBase,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10.0,
                            width: 10.0,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const CustomIcon(
                                customIcon: AppIcons.kIconArrowUp,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          SizedBox(
                            height: 7.5,
                            width: 7.5,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const CustomIcon(
                                customIcon: AppIcons.kIconArrowDown,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.repeats,
                      style: AppTextStyles.kSFBody14.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.kColBase,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        Row(
          children: <Widget>[
            Radio<RepeatMode>(
              groupValue: _groupRepeatMode,
              value: RepeatMode.never,
              onChanged: (value) {
                setState(() {
                  _groupRepeatMode = value;
                });
              },
              activeColor: AppColors.kColAccentNormal,
            ),
            Text(
              AppLocalizations.of(context)!.repeatNever,
              style: AppTextStyles.kSFFootnoteAndSubhead,
            ),
          ],
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
