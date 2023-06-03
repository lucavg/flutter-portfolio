import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProjectsViewModel with ChangeNotifierEx {
  var _isLoading = false;
  String? _errorKey;
  final int _currentIndex = 4;

  bool get isLoading => _isLoading;
  String? get errorKey => _errorKey;
  int get currentIndex => _currentIndex;

  ProjectsViewModel();

  Future<void> init() async {
    try {
      _isLoading = true;
      _errorKey = null;
      notifyListeners();
    } catch (e, stack) {
      logger.error('failed to load projects screen', error: e, trace: stack);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
