import 'package:dio/dio.dart';
import 'package:flutter_template/di/injectable.dart';
import 'package:flutter_template/model/exceptions/un_authorized_error.dart';
import 'package:flutter_template/repository/secure_storage/auth/auth_storage.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../app_constants.dart';

@singleton
class NetworkRefreshInterceptor extends SimpleInterceptor {
  final AuthStorage _authStorage;

  final _excludedPaths = [
    'login',
  ];

  NetworkRefreshInterceptor(
    this._authStorage,
  );

  @override
  Future<Object?> onError(DioError error) async {
    final request = error.requestOptions;
    if (_excludedPaths.contains(request.path)) {
      logger.debug('Network refresh interceptor should not intercept');
      return super.onError(error);
    }

    if (error is! UnAuthorizedError) {
      return super.onError(error);
    }

    final authorizationHeader = '${AppConstants.protectedAuthenticationHeaderPrefix} ${await _authStorage.getAccessToken()}';
    request.headers[AppConstants.authorizationHeader] = authorizationHeader;

    return getIt.get<Dio>().fetch<dynamic>(request);
  }
}
