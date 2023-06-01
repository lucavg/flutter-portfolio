import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/architecture.dart';
import 'package:my_flutter_portfolio/util/web/app_configurator.dart' if (dart.library.html) 'package:my_flutter_portfolio/util/web/app_configurator_web.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

FutureOr<R>? wrapMain<R>(FutureOr<R> Function() appCode) async {
  PlatformDispatcher.instance.onError = (error, trace) {
    try {
      WidgetsFlutterBinding.ensureInitialized();
    } catch (_) {}

    try {
      staticLogger.e('Uncaught platform error', error: error, trace: trace);
    } catch (_) {
      // ignore: avoid_print
      print(error);
      // ignore: avoid_print
      print(trace);
    }

    if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) {
      FirebaseCrashlytics.instance.recordError(error, trace);
    }
    return true; // Handled
  };

  WidgetsFlutterBinding.ensureInitialized();
  configureWebApp();
  // await _setupCrashLogging();
  await initArchitecture();

  return await appCode();
}
