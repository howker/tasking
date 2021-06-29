import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:wundertusk/repository/tags/tags_repository.dart';
import 'package:wundertusk/repository/user/user_repository.dart';
import 'package:wundertusk/screens/actions_journal/actions_journal_screen.dart';
import 'package:wundertusk/models/task/task.dart';
import 'package:wundertusk/models/task_image.dart';
import 'package:wundertusk/screens/tags_settings/tags_settings_screen.dart';
import 'package:wundertusk/screens/splash/splash_screen.dart';
import 'package:wundertusk/screens/tags_settings/tags_settings_screen_provider.dart';
import 'package:wundertusk/services/navigation/route_paths.dart';
import 'package:wundertusk/screens/sign_in/sign_in_screen.dart';
import 'package:wundertusk/screens/auth/restore_pass_letter_screen/restore_pass_letter_screen.dart';
import 'package:wundertusk/screens/auth/restore_password_finish_screen/restore_password_finish_screen.dart';
import 'package:wundertusk/screens/auth/restore_password_screen/restore_password_screen.dart';
import 'package:wundertusk/screens/sign_up/sign_up_first_step_screen/sign_up_first_step_screen.dart';
import 'package:wundertusk/screens/sign_up/sign_up_second_step_screen/sign_up_second_step_screen.dart';
import 'package:wundertusk/screens/group_task/group_task_screen.dart';
import 'package:wundertusk/screens/group_task/screens/task_image/task_image_screen.dart';
import 'package:wundertusk/screens/home/home_screen.dart';
import 'package:wundertusk/screens/integrations_and_import/integration_and_import_screen.dart';
import 'package:wundertusk/screens/qr_code_generator/qr_code_generator_screen.dart';
import 'package:wundertusk/screens/new_project/new_project_screen.dart';
import 'package:wundertusk/services/providers/auth_providers/sign_in_provider.dart';
import 'package:wundertusk/services/providers/auth_providers/sign_up_provider.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutePaths.loginScreen:
        return _navigate(
          ChangeNotifierProvider(
            create: (context) => SignInProvider(
              context.read<UserRepository>(),
            ),
            child: const SignInScreen(),
          ),
        );
      case RoutePaths.signUp1Screen:
        return _navigate(const SignUpFirstStepScreen());
      case RoutePaths.signUp2Screen:
        return _navigate(
          ChangeNotifierProvider.value(
            value: routeSettings.arguments! as SignUpProvider,
            child: const SignUpSecondStepScreen(),
          ),
        );
      case RoutePaths.homeScreen:
        return _navigate(const HomeScreen());
      case RoutePaths.taskDetailScreen:
        return _navigate(
          TaskDetailScreen(
            task: routeSettings.arguments! as Task,
          ),
        );
      case RoutePaths.imageScreen:
        return _navigate(
          TaskImageScreen(
            taskImage: routeSettings.arguments! as TaskImage,
          ),
        );
      case RoutePaths.newProjectScreen:
        return _navigate(const NewProjectScreen());
      case RoutePaths.restorePasswordScreen:
        return _navigate(
          const RestorePasswordScreen(),
        );
      case RoutePaths.restorePasswordLetterScreen:
        return _navigate(
          const RestorePasswordLetterScreen(),
        );
      case RoutePaths.restorePasswordFinishScreen:
        return _navigate(
          RestorePasswordFinishScreen(
            secret: routeSettings.arguments! as String,
          ),
        );
      case RoutePaths.qrCodeGeneratorScreen:
        return _navigate(
          QRCodeGeneratorScreen(qrData: routeSettings.arguments.toString()),
        );
      case RoutePaths.integrationAndImportScreen:
        return _navigate(
          const IntegrationAndImportScreen(),
        );
      case RoutePaths.actionsJournalScreen:
        return _navigate(
          const ActionsJournalScreen(),
        );
      case RoutePaths.tagsSettingsScreen:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (context, _, __) {
            return ChangeNotifierProvider(
              create: (_) => TagsSettingsScreenProvider(
                context.read<TagsRepository>(),
              ),
              child: const TagsSettingsScreen(),
            );
          },
        );
      case RoutePaths.splashScreen:
        return _navigate(
          const SplashScreen(),
        );
    }
    return _navigate(const SignInScreen());
  }

  static PageRouteBuilder<dynamic> _navigate(Widget widget) {
    return PageRouteBuilder<dynamic>(
      pageBuilder: (context, animation, secAnimation) {
        return widget;
      },
    );
  }
}
