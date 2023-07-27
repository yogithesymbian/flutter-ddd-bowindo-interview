import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_wonderwoman_projectscoid/sake.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark),
  );

  Function originalOnError = FlutterError.onError!;

  if (kReleaseMode) {
    debugPrint = (message, {wrapWidth}) {};
  }
  runZonedGuarded(
    () async {
      runApp(
        const ProviderScope(
          child: App(),
        ),
      );
    },
    (exception, stackTrace) async {
      // FirebaseCrashlytics.instance.recordError(exception, stackTrace);
      // await Sentry.captureException(exception, stackTrace: stackTrace);
    },
  );
}
