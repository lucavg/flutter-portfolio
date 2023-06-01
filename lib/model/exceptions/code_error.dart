import 'package:my_flutter_portfolio/util/env/flavor_config.dart';
import 'package:my_flutter_portfolio/util/locale/localization_keys.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class CodeError with LocalizedError {
  @override
  String getLocalizedKey() {
    if (FlavorConfig.isDev()) {
      return LocalizationKeys.errorDuringDev;
    }
    return LocalizationKeys.errorGeneral;
  }
}
