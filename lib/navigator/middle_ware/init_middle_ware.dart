import 'package:my_flutter_portfolio/di/injectable.dart';
import 'package:my_flutter_portfolio/repository/secure_storage/auth/auth_storage.dart';

Future<void> initMiddleWare() async {
  await getIt<AuthStorage>().hasLoggedInUser();
}
