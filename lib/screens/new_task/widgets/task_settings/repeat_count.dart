import 'package:flutter/material.dart';

import 'package:wundertusk/key_packages.dart';

class RepeatCount extends StatefulWidget {
  const RepeatCount({
    Key? key,
  }) : super(key: key);

  @override
  _RepeatCountState createState() => _RepeatCountState();
}

class _RepeatCountState extends State<RepeatCount> {
  late List<int> countOptions;
  late List<String> daysOptions;
  late List<String> monthsOptions;
  late int countModeValue;
  late String daysModeValue;
  late String monthsModeValue;

  @override
  void initState() {
    super.initState();

    initOptions();
    initValues();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(left: 16.0),
                margin: const EdgeInsets.fromLTRB(16.0, 12.0, 8.0, 0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: AppColors.kColBase3, width: 2.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '$countModeValue',
                      style: AppTextStyles.kSFBody14.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    PopupMenuButton<int>(
                      icon: const CustomIcon(
                        customIcon: AppIcons.kIconArrowDown,
                      ),
                      itemBuilder: (_) {
                        return countOptions
                            .map(
                              (element) => PopupMenuItem(
                                value: element,
                                child: Text('$element'),
                              ),
                            )
                            .toList();
                      },
                      onSelected: (value) {
                        setState(() {
                          countModeValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.only(left: 16.0),
                margin: const EdgeInsets.only(top: 12.0, right: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(color: AppColors.kColBase3, width: 2.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      daysModeValue,
                      style: AppTextStyles.kSFBody14.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    PopupMenuButton<String>(
                      icon: const CustomIcon(
                        customIcon: AppIcons.kIconArrowDown,
                      ),
                      itemBuilder: (_) => daysOptions
                          .map(
                            (element) => PopupMenuItem(
                              value: element,
                              child: Text(element),
                            ),
                          )
                          .toList(),
                      onSelected: (value) {
                        setState(() {
                          daysModeValue = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.only(left: 16.0),
          margin: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: AppColors.kColBase3, width: 2.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                monthsModeValue,
                style: AppTextStyles.kSFBody14.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              PopupMenuButton<String>(
                icon: const CustomIcon(
                  customIcon: AppIcons.kIconArrowDown,
                ),
                itemBuilder: (_) => monthsOptions
                    .map(
                      (element) => PopupMenuItem(
                        value: element,
                        child: Text(element),
                      ),
                    )
                    .toList(),
                onSelected: (value) {
                  setState(() {
                    monthsModeValue = value;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void initOptions() {
    setState(() {
      countOptions = List.generate(30, (index) => index);
      daysOptions = [
        AppLocalizations.of(context)!.modeDays,
        AppLocalizations.of(context)!.modeWeeks,
      ];
      monthsOptions = [AppLocalizations.of(context)!.modeMonths];
    });
  }

  void initValues() {
    setState(() {
      countModeValue = countOptions[0];
      daysModeValue = daysOptions[0];
      monthsModeValue = monthsOptions[0];
    });
  }
}
