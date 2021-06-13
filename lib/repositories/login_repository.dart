import 'package:flutter/cupertino.dart';
import 'package:login_river_pod/data_source/login_data_source.dart';
import 'package:login_river_pod/request/login_request.dart';
import 'package:login_river_pod/response/login_response.dart';

import '../app_result.dart';

abstract class LoginRepository {

  Future<AppResult<LoginResponse>> login({@required LoginRequest loginRequest});
}

class LoginRepositoryImpl implements LoginRepository {
  LoginRemoteDataSource _loginRemoteDataSource;

  LoginRepositoryImpl(this._loginRemoteDataSource);

  @override
  Future<AppResult<LoginResponse>> login(
      {@required LoginRequest loginRequest}) {
    return _loginRemoteDataSource.login(loginRequest: loginRequest);
  }


}
