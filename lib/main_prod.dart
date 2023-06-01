import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/app.dart';
import 'package:my_flutter_portfolio/architecture.dart';
import 'package:my_flutter_portfolio/di/environments.dart';
import 'package:my_flutter_portfolio/di/injectable.dart';
import 'package:my_flutter_portfolio/main_common.dart';
import 'package:my_flutter_portfolio/util/env/flavor_config.dart';

Future<void> main() async {
  await wrapMain(() async {
    await initArchitecture();
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: false,
      showFullErrorMessages: false,
    );
    FlavorConfig(
      flavor: Flavor.prod,
      name: 'PROD',
      color: Colors.transparent,
      values: values,
    );
    await configureDependencies(Environments.prod);
    runApp(const MyApp());
  });
}
