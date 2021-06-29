import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/models/comment_data.dart';
import 'package:wundertusk/resources/app_colors.dart';
import 'package:wundertusk/resources/app_icons.dart';
import 'package:wundertusk/screens/group_task/components/record_widget.dart';

class CommentCard extends StatelessWidget {
  final int index;
  final CommentData comment;

  const CommentCard({
    required this.comment,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    index.isOdd;

    return Slidable(
      actionPane: const SlidableScrollActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          color: Colors.grey.shade200,
          iconWidget: const CustomIcon(
            customIcon: AppIcons.kIconEdit,
          ),
          onTap: () {},
        ),
        IconSlideAction(
          color: Colors.grey.shade200,
          iconWidget: const CustomIcon(
            customIcon: AppIcons.kIconDelete,
          ),
          onTap: () {},
        ),
      ],
      actions: <Widget>[
        IconSlideAction(
          color: Colors.grey.shade200,
          iconWidget: const CustomIcon(
            customIcon: AppIcons.kIconLike,
            color: Colors.red,
          ),
          onTap: () {},
        ),
      ],
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.kColBase4),
          ),
        ),
        child: ListTile(
          trailing: Text(comment.date),
          isThreeLine: true,
          title: Text(comment.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (index.isOdd)
                const RecordWidget()
              else
                const Text('Простая проверка'),
              Row(
                children: [
                  const CustomIcon(
                    customIcon: AppIcons.kIconLike,
                    color: Colors.red,
                  ),
                  const Text(
                    ' 3',
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                  Text(
                    AppLocalizations.of(context)!.like,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ],
          ),
          leading: CircleAvatar(
            backgroundImage: AssetImage(comment.imagePath),
          ),
        ),
      ),
    );
  }
}
