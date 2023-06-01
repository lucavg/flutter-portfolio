import 'package:my_flutter_portfolio/di/injectable.dart';
import 'package:my_flutter_portfolio/styles/theme_data.dart';

extension ThemeExtension on Object {
  MFPTheme get theme => getIt();
}
