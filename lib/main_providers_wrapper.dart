import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/data_sources/local/token/token_local_data_source.dart';
import 'package:wundertusk/data_sources/local/token/token_local_data_source_impl.dart';
import 'package:wundertusk/data_sources/remote/accounts/accounts_remote_data_source.dart';
import 'package:wundertusk/data_sources/remote/accounts/accounts_remote_data_source_impl.dart';
import 'package:wundertusk/data_sources/remote/authentication/authentication_remote_data_source.dart';
import 'package:wundertusk/data_sources/remote/authentication/authentication_remote_data_source_impl.dart';
import 'package:wundertusk/data_sources/remote/comment/comment_remote_data_source.dart';
import 'package:wundertusk/data_sources/remote/comment/comment_remote_data_source_impl.dart';
import 'package:wundertusk/data_sources/remote/executors/executors_remote_data_source.dart';
import 'package:wundertusk/data_sources/remote/executors/executors_remote_data_source_impl.dart';
import 'package:wundertusk/data_sources/remote/group/group_remote_data_source.dart';
import 'package:wundertusk/data_sources/remote/group/group_remote_data_source_impl.dart';
import 'package:wundertusk/data_sources/remote/tag/tag_remote_data_source.dart';
import 'package:wundertusk/data_sources/remote/tag/tag_remote_data_source_impl.dart';
import 'package:wundertusk/data_sources/remote/task/task_remote_data_source.dart';
import 'package:wundertusk/data_sources/remote/task/task_remote_data_source_impl.dart';
import 'package:wundertusk/data_sources/remote/task_doc/task_doc_remote_data_source.dart';
import 'package:wundertusk/data_sources/remote/task_doc/task_doc_remote_data_source_impl.dart';
import 'package:wundertusk/data_sources/remote/task_image/task_image_remote_data_source.dart';
import 'package:wundertusk/data_sources/remote/task_image/task_image_remote_data_source_impl.dart';
import 'package:wundertusk/data_sources/remote/task_tag/task_tag_remote_data_source.dart';
import 'package:wundertusk/data_sources/remote/task_tag/task_tag_remote_data_source_impl.dart';
import 'package:wundertusk/data_sources/remote/task_tree/task_tree_remote_data_source.dart';
import 'package:wundertusk/data_sources/remote/task_tree/task_tree_remote_data_source_impl.dart';
import 'package:wundertusk/data_sources/remote/token/token_remote_data_source.dart';
import 'package:wundertusk/data_sources/remote/token/token_remote_data_source_impl.dart';
import 'package:wundertusk/repository/comments/comments_repository.dart';
import 'package:wundertusk/repository/comments/comments_repository_impl.dart';
import 'package:wundertusk/repository/group/group_repository.dart';
import 'package:wundertusk/repository/group/group_repository_impl.dart';
import 'package:wundertusk/repository/tags/tags_repository.dart';
import 'package:wundertusk/repository/tags/tags_repository_impl.dart';
import 'package:wundertusk/repository/tasks/tasks_repository.dart';
import 'package:wundertusk/repository/tasks/tasks_repository_impl.dart';
import 'package:wundertusk/repository/tasks_tags/tasks_tags_repository.dart';
import 'package:wundertusk/repository/tasks_tags/tasks_tags_repository_impl.dart';
import 'package:wundertusk/repository/user/user_repository.dart';
import 'package:wundertusk/repository/user/user_repository_impl.dart';
import 'package:wundertusk/services/providers/auth_providers/providers.dart';
import 'package:wundertusk/services/providers/group_providers/group_list_provider.dart';
import 'package:wundertusk/services/providers/group_task_providers/group_task_provider.dart';
import 'package:wundertusk/services/providers/tag_providers/tag_list_provider.dart';
import 'package:wundertusk/services/providers/task_providers/task_attachments_provider.dart';
import 'package:wundertusk/services/providers/task_providers/task_create_provider.dart';
import 'package:wundertusk/services/providers/task_providers/task_creator_provider.dart';
import 'package:wundertusk/services/providers/task_providers/task_executors_provider.dart';
import 'package:wundertusk/services/providers/task_providers/task_list_provider.dart';
import 'package:wundertusk/services/providers/user_providers/user_provider.dart';
import 'package:wundertusk/services/providers/user_providers/users_list_provider.dart';

class MainProvidersWrapper extends StatelessWidget {
  final Widget app;

  const MainProvidersWrapper({
    required this.app,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// Providers
        ///
        /// Data Sources
        ///
        /// Local
        Provider<TokenLocalDataSource>(
          create: (_) => TokenLocalDataSourceImpl(),
        ),

        /// Remote
        Provider<AccountsRemoteDataSource>(
          create: (_) => AccountsRemoteDataSourceImpl(),
        ),
        Provider<CommentRemoteDataSource>(
          create: (_) => CommentRemoteDataSourceImpl(),
        ),
        Provider<TagRemoteDataSource>(
          create: (_) => TagRemoteDataSourceImpl(),
        ),
        Provider<TaskRemoteDataSource>(
          create: (_) => TaskRemoteDataSourceImpl(),
        ),
        Provider<TaskTagRemoteDataSource>(
          create: (_) => TaskTagRemoteDataSourceImpl(),
        ),
        Provider<TaskTreeRemoteDataSource>(
          create: (_) => TaskTreeRemoteDataSourceImpl(),
        ),
        Provider<TaskImageRemoteDataSource>(
          create: (_) => TaskImageRemoteDataSourceImpl(),
        ),
        Provider<TaskDocRemoteDataSource>(
          create: (_) => TaskDocRemoteDataSourceImpl(),
        ),
        Provider<GroupRemoteDataSource>(
          create: (_) => GroupRemoteDataSourceImpl(),
        ),
        Provider<ExecutorsRemoteDataSource>(
          create: (_) => ExecutorsRemoteDataSourceImpl(),
        ),
        Provider<TokenRemoteDataSource>(
          create: (context) => TokenRemoteDataSourceImpl(
            context.read<TokenLocalDataSource>(),
          ),
        ),
        Provider<AuthenticationRemoteDataSource>(
          create: (context) => AuthenticationRemoteDataSourceImpl(
            context.read<TokenRemoteDataSource>(),
          ),
        ),

        /// Repositories
        Provider<GroupRepository>(
          create: (context) => GroupRepositoryImpl(
            context.read<GroupRemoteDataSource>(),
            context.read<TokenLocalDataSource>(),
          ),
        ),
        Provider<TagsRepository>(
          create: (context) => TagsRepositoryImpl(
            context.read<TagRemoteDataSource>(),
            context.read<TokenLocalDataSource>(),
          ),
        ),
        Provider<TasksTagsRepository>(
          create: (context) => TasksTagsRepositoryImpl(
            context.read<TaskTagRemoteDataSource>(),
            context.read<TokenLocalDataSource>(),
          ),
        ),
        Provider<CommentsRepository>(
          create: (context) => CommentsRepositoryImpl(
            context.read<CommentRemoteDataSource>(),
          ),
        ),
        Provider<UserRepository>(
          create: (context) => UserRepositoryImpl(
            context.read<AccountsRemoteDataSource>(),
            context.read<AuthenticationRemoteDataSource>(),
            context.read<TokenLocalDataSource>(),
            context.read<TokenRemoteDataSource>(),
          ),
        ),
        Provider<TasksRepository>(
          create: (context) => TasksRepositoryImpl(
            context.read<TaskRemoteDataSource>(),
            context.read<TaskTagRemoteDataSource>(),
            context.read<ExecutorsRemoteDataSource>(),
            context.read<TaskImageRemoteDataSource>(),
            context.read<TaskDocRemoteDataSource>(),
            context.read<TokenLocalDataSource>(),
          ),
        ),

        /// Change notifier providers
        ChangeNotifierProvider<ErrorStateProvider>(
          create: (_) => ErrorStateProvider(),
        ),
        ChangeNotifierProvider<UserLoginPassProvider>(
          create: (_) => UserLoginPassProvider(),
        ),
        ChangeNotifierProvider<UserNameProvider>(
          create: (_) => UserNameProvider(),
        ),
        ChangeNotifierProvider<TaskListProvider>(
          create: (context) => TaskListProvider(
            context.read<TasksRepository>(),
            context.read<GroupRepository>(),
          ),
        ),
        ChangeNotifierProvider<TagListProvider>(
          create: (context) => TagListProvider(
            context.read<TagsRepository>(),
          ),
        ),
        ChangeNotifierProvider<GroupListProvider>(
          create: (context) => GroupListProvider(
            context.read<GroupRepository>(),
          ),
        ),
        ChangeNotifierProvider<UsersListProvider>(
          create: (context) => UsersListProvider(
            context.read<UserRepository>(),
          ),
        ),
        ChangeNotifierProvider<TaskAttachmentsProvider>(
          create: (context) => TaskAttachmentsProvider(
            context.read<TasksRepository>(),
          ),
        ),
        ChangeNotifierProvider<TaskExecutorsProvider>(
          create: (context) => TaskExecutorsProvider(
            context.read<TasksRepository>(),
          ),
        ),
        ChangeNotifierProvider<GroupTaskProvider>(
          create: (context) => GroupTaskProvider(
            context.read<TasksTagsRepository>(),
            context.read<TasksRepository>(),
          ),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(
            context.read<UserRepository>(),
          ),
        ),

        /// Providers
        Provider(
          create: (context) => TaskCreatorProvider(
            context.read<UserRepository>(),
          ),
        ),
        Provider<TaskCreateProvider>(
          create: (context) => TaskCreateProvider(
            context.read<TasksRepository>(),
          ),
        ),
      ],
      child: app,
    );
  }
}
