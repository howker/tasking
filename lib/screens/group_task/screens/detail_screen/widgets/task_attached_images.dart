import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/models/task_image.dart';
import 'package:wundertusk/services/providers/task_providers/task_attachments_provider.dart';
import 'package:wundertusk/resources/app_colors.dart';

class TaskAttachedImages extends StatelessWidget {
  final Task task;

  const TaskAttachedImages({
    required this.task,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: context.read<TaskAttachmentsProvider>().fetchTaskImagesList(
            task,
          ),
      builder: (_, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: Column(
                children: const <Widget>[
                  Text('Подождите, картинки загружаются..'),
                  SizedBox(height: 8.0),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        }

        // notifyListener will not work with List,
        // because when you manipulate with contained objects
        // the list object stays always the same.
        //
        // Because of that there is we listen to list length,
        // because length will change after adding/removing objects
        return Selector<TaskAttachmentsProvider, int?>(
          selector: (_, provider) => provider.cachedImages?.length,
          builder: (_, __, ___) {
            return Selector<TaskAttachmentsProvider, List<TaskImage>?>(
              selector: (_, provider) => provider.cachedImages,
              builder: (_, taskImages, __) {
                if (taskImages == null || taskImages.isEmpty) {
                  return const SizedBox.shrink();
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 5.0,
                      crossAxisCount: 4,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: taskImages.length,
                    itemBuilder: (_, index) {
                      final taskImage = taskImages[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutePaths.imageScreen,
                            arguments: taskImage,
                          );
                        },
                        child: Hero(
                          tag: '${taskImage.id}',
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.kColBase3),
                              borderRadius: BorderRadius.circular(12.0),
                              image: DecorationImage(
                                image: NetworkImage(taskImage.url),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
