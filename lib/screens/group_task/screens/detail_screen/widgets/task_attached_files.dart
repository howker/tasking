import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/models/task_doc.dart';
import 'package:wundertusk/services/providers/task_providers/task_attachments_provider.dart';

class TaskAttachedFiles extends StatelessWidget {
  final Task task;

  const TaskAttachedFiles({
    required this.task,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: context.read<TaskAttachmentsProvider>().fetchTaskDocsList(task),
      builder: (_, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: Column(
                children: const <Widget>[
                  Text('Подождите, файлы загружаются..'),
                  SizedBox(height: 8.0),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        }

        return Selector<TaskAttachmentsProvider, int?>(
          selector: (_, provider) => provider.cachedDocs?.length,
          builder: (_, __, ___) {
            return Selector<TaskAttachmentsProvider, List<TaskDoc>?>(
              selector: (_, provider) => provider.cachedDocs,
              builder: (_, taskDocs, __) {
                if (taskDocs == null || taskDocs.isEmpty) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: taskDocs.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                const CustomIcon(
                                  width: 22.0,
                                  height: 22.0,
                                  customIcon: AppIcons.kIconFile,
                                  color: AppColors.kColBase2,
                                ),
                                const SizedBox(width: 12.0),
                                Expanded(
                                  child: Text(
                                    Uri.decodeComponent(taskDocs[index].url.split('/').last),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await context
                                        .read<TaskAttachmentsProvider>()
                                        .deleteDocFromTask(taskDocs[index]);
                                  },
                                  child: const CustomIcon(
                                    width: 26.0,
                                    height: 26.0,
                                    customIcon: AppIcons.kIconCloseCircle,
                                    color: AppColors.kColBase2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        );

        // return Row(
        //   children: <Widget>[
        //     InkWell(
        //       onTap: () {},
        //       customBorder: const StadiumBorder(),
        //       child: Container(
        //         decoration: const BoxDecoration(
        //           color: ColorTheme.kColBGAccentButton,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(40),
        //           ),
        //         ),
        //         child: Padding(
        //           padding:
        //               const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        //           child: Row(
        //             children: <Widget>[
        //               const CustomIcon(
        //                 customIcon: CustomIcons.kIconFile,
        //               ),
        //               Text(AppLocalizations.of(context)!.additionalMaterial),
        //             ],
        //           ),
        //         ),
        //       ),
        //     ),
        //     const SizedBox(width: 15.0),
        //     Container(
        //       decoration: const BoxDecoration(
        //         color: ColorTheme.kColBGAccentButton,
        //         shape: BoxShape.circle,
        //       ),
        //       child: IconButton(
        //         onPressed: () {},
        //         icon: const CustomIcon(
        //           customIcon: CustomIcons.kIconMicro,
        //         ),
        //       ),
        //     ),
        //   ],
        // );
      },
    );
  }
}
