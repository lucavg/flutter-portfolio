import 'package:my_flutter_portfolio/navigator/main_navigator.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class SimpleScreenViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;

  SimpleScreenViewModel(this._navigator);

  void goToHomeScreen() => _navigator.goToHomeScreen();
}
