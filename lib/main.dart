import 'dart:async';
import 'dart:io';

import 'package:auto_route_demo_flow/arch/app_bloc_observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'arch/logger.dart';
import 'internal/app.dart';
import 'internal/app_initialisation.dart';
import 'presentation/screens/misc/error_screen.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) =>
      kReleaseMode ? const ErrorScreen() : ErrorWidget(details.exception);

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await AppInitialization.I.initApp();
    BlocOverrides.runZoned(
      () {
        runApp(App());
      },
      blocObserver: AppBlocObserver(),
    );
  }, (error, stackTrace) {
    Logger.log('runZonedGuarded: Caught error in root zone. '
        'error: $error, stackTrace: $stackTrace');
  })?.catchError((e) {
    Logger.printException(e);
    Logger.log('FAILED TO INIT APP');
    exit(-1);
  });
}
