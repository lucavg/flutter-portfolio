import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:my_flutter_portfolio/navigator/main_navigator.dart';

@injectable
class SimpleScreenViewModel with ChangeNotifierEx {
  final MainNavigator _mainNavigator;

  SimpleScreenViewModel(this._mainNavigator);

  void navigateTo(int index) {
    notifyListeners();
    switch (index) {
      case 0:
        _mainNavigator.goToHomeScreen();
        break;
      case 1:
        _mainNavigator.goToAboutScreen();
        break;
      case 2:
        _mainNavigator.goToExperienceScreen();
        break;
      case 3:
        _mainNavigator.goToInternshipScreen();
        break;
      case 4:
        _mainNavigator.goToProjectsScreen();
        break;
      case 5:
        _mainNavigator.goToContactScreen();
        break;
    }
  }

  Future<void> init() async {
    try {
      notifyListeners();
    } catch (e, stack) {
      logger.error('failed to retrieve tournament dates', error: e, trace: stack);
    } finally {
      notifyListeners();
    }
  }
}
