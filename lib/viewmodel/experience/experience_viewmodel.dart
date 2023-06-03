import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExperienceViewModel with ChangeNotifierEx {
  var _isLoading = false;
  String? _errorKey;
  final int _currentIndex = 2;

  bool get isLoading => _isLoading;
  String? get errorKey => _errorKey;
  int get currentIndex => _currentIndex;

  ExperienceViewModel();

  Future<void> init() async {
    try {
      _isLoading = true;
      _errorKey = null;
      notifyListeners();
    } catch (e, stack) {
      logger.error('failed to load experience viewmodel', error: e, trace: stack);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
