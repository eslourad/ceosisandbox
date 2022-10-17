import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sandbox/configurations/api_configuration.dart';
import 'package:sandbox/repositories/auth_repository_interface.dart';

class AuthRepository implements AuthRepositoryInterface {
  @override
  String register() {
    return ApiConfiguration.baseUrl;
  }

  @override
  void login() {}
}
