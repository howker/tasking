import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:wundertusk/key_packages.dart';
import 'package:wundertusk/main_providers_wrapper.dart';
import 'package:wundertusk/resources/app_themes.dart';
import 'package:wundertusk/services/navigation/route_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainProvidersWrapper(
      app: MaterialApp(
        title: 'Wundertask',
        theme: AppThemes.mainTheme,
        initialRoute: RoutePaths.splashScreen,
        onGenerateRoute: RouteGenerator.generateRoute,
        supportedLocales: const [
          Locale('ru', 'RU'),
        ],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
