import 'package:flutter/material.dart';

import 'package:wundertusk/screens/actions_journal/actions_journal_screen_widgets.dart';

class ActionsJournalScreen extends StatelessWidget {
  const ActionsJournalScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ActionsJournalScreenAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ActionsListWidget(
                  actionData: DateTime.now(),
                  actionsList: tempTodayActionsList,
                ),
                ActionsListWidget(
                  actionData: DateTime.now().subtract(
                    const Duration(days: 1),
                  ),
                  actionsList: tempYesterdayActionsList,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<ActionCardWidget> tempTodayActionsList = [
  const ActionCardWidget(
    action: 'Вы выполнили задачу: Удалить игры',
    projectName: 'Все мои задачи',
    time: '14:45',
  ),
  const ActionCardWidget(
    action:
        'Вы изменили название: Отрисовать экран на Отрисовать другие экраны',
    projectName: 'Все мои задачи',
    time: '11:03',
  ),
  const ActionCardWidget(
    action: 'Вы изменили срок выполнения Отрисовать другие экраны на 28 апр.',
    projectName: 'Все мои задачи',
    time: '11:03',
  ),
];

List<ActionCardWidget> tempYesterdayActionsList = [
  const ActionCardWidget(
    action: 'Вы добавили задачу: Конвертировать папку файлов',
    projectName: 'Auditor.pro',
    time: '04:15',
  ),
  const ActionCardWidget(
    action: 'Вы изменили название: Очистить ПК на Очистить хард С',
    projectName: 'Auditor.pro',
    time: '22:15',
  ),
  const ActionCardWidget(
    action: 'Вы изменили срок выполнения Отрисовать другие экраны на 30 апр.',
    projectName: 'Все мои задачи',
    time: '16:17',
  ),
];
