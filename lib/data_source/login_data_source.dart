import 'package:flutter/cupertino.dart';
import 'package:login_river_pod/request/login_request.dart';
import 'package:login_river_pod/response/login_response.dart';

import '../app_result.dart';
import 'login_service_provider.dart';
abstract class LoginRemoteDataSource {
  Future<AppResult> login({@required LoginRequest loginRequest});
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final LoginService loginService;

  LoginRemoteDataSourceImpl({this.loginService});

  @override
  Future<AppResult<LoginResponse>> login(
      {@required LoginRequest loginRequest}) async {
    return await loginService.login(loginRequest: loginRequest);
  }

}
