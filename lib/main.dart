import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_weather_app/application.dart';
import 'package:flutter_weather_app/di.dart';
import 'package:flutter_weather_app/environment_configuration.dart';
import 'package:flutter_weather_app/firebase_options.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get_secure_storage/get_secure_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // orientation
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  // secure storage initialization
  await GetSecureStorage.init();

  // Firebase initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // errors logging
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  // environment
  await dotenv.load(fileName: EnvironmentConfiguration.development);
  final environment = dotenv.loadEnvironment();

  // di
  AppModule.register(environment);

  runApp(const Application());
}
