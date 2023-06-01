import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/app.dart';
import 'package:my_flutter_portfolio/di/environments.dart';
import 'package:my_flutter_portfolio/di/injectable.dart';
import 'package:my_flutter_portfolio/main_common.dart';
import 'package:my_flutter_portfolio/util/env/flavor_config.dart';

Future<void> main() async {
  await wrapMain(() async {
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
      logNetworkInfo: false,
      showFullErrorMessages: true,
    );
    FlavorConfig(
      flavor: Flavor.beta,
      name: 'BETA',
      color: Colors.blue,
      values: values,
    );
    await configureDependencies(Environments.prod);
    runApp(const MyApp());
  });
}
