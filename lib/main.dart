import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/app.dart';
import 'package:my_flutter_portfolio/di/environments.dart';
import 'package:my_flutter_portfolio/di/injectable.dart';
import 'package:my_flutter_portfolio/main_common.dart';
import 'package:my_flutter_portfolio/util/env/flavor_config.dart';
import 'package:my_flutter_portfolio/util/inspector/local_storage_inspector.dart';
import 'package:my_flutter_portfolio/util/inspector/niddler.dart';

Future<void> main() async {
  await wrapMain(() async {
    await initNiddler();
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: true,
      showFullErrorMessages: true,
    );
    FlavorConfig(
      flavor: Flavor.dev,
      name: 'DEV',
      color: Colors.red,
      values: values,
    );
    // ignore: avoid_print
    print('Starting app from main.dart');
    await configureDependencies(Environments.dev);
    await initAllStorageInspectors();

    runApp(const MyApp());
  });
}
