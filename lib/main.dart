import 'package:doctor_hunt/apps/Patient/core/di/injection.dart';
import 'package:doctor_hunt/apps/Patient/core/router/app_router.dart';
import 'package:doctor_hunt/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');

  //Supabase
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    publishableKey: dotenv.env['SUPABASE_PUBLISHABLE_KEY']!,
  );

  // Follow the device language
  LocaleSettings.useDeviceLocale();

  await setupDependencies();

  runApp(TranslationProvider(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      title: t.appName,
      routerConfig: appRouter,

      // Slang locale
      locale: TranslationProvider.of(context).flutterLocale,

      // Supported languages
      supportedLocales: AppLocaleUtils.supportedLocales,

      // Flutter localization
      localizationsDelegates: GlobalMaterialLocalizations.delegates,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      builder: (context, child) => child!,
    );
  }
}

//Totamadina@1989 databasepassword
