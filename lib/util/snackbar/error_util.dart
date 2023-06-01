import 'package:my_flutter_portfolio/di/injectable.dart';
import 'package:my_flutter_portfolio/navigator/main_navigator.dart';
import 'package:my_flutter_portfolio/util/env/flavor_config.dart';
import 'package:my_flutter_portfolio/util/locale/localization_keys.dart';
import 'package:get/get.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../locale/localization.dart';

@lazySingleton
class ErrorUtil {
  String? showError(dynamic error) {
    String key;
    if (error is String) {
      _showError(error);
      return null;
    } else if (error is NetworkError) {
      if (error.showInProduction) {
        key = error.getLocalizedKey();
      } else if (FlavorConfig.instance.values.showFullErrorMessages) {
        final code = error.getErrorCode;
        if (code == null) {
          key = LocalizationKeys.errorGeneral;
        } else {
          showErrorWithLocaleKey(LocalizationKeys.errorGeneralWithCode, args: <String>[code]);
          return null;
        }
      } else {
        key = LocalizationKeys.errorGeneral;
      }
    } else if (error is LocalizedError) {
      key = error.getLocalizedKey();
    } else {
      logger.warning('Caught an error that is not handled by the MFPError $error');
      key = LocalizationKeys.errorGeneral;
    }
    showErrorWithLocaleKey(key);
    return key;
  }

  void _showError(String error) => getIt.get<MainNavigator>().showCustomSnackBar(message: error);

  void showErrorWithLocaleKey(String errorKey, {List<dynamic>? args}) => _showError(Localization.of(Get.context!).getTranslation(errorKey));
}
