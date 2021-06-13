import 'package:flutter/cupertino.dart';
import 'package:login_river_pod/repositories/login_repository.dart';
import 'package:login_river_pod/request/login_request.dart';
import 'package:login_river_pod/response/login_response.dart';

import '../app_result.dart';
abstract class LoginUseCase {
  Future<AppResult<LoginResponse>> execute(
      {@required LoginRequest loginRequest});
}

class LoginUseCaseImpl implements LoginUseCase {
  LoginRepository _repository;

  LoginUseCaseImpl(this._repository);

  @override
  Future<AppResult<LoginResponse>> execute(
      {@required LoginRequest loginRequest}) async {
    final response = await _repository.login(loginRequest: loginRequest);

    switch (response.status) {
      case Status.SUCCESS:
        //handle smth if have
        return response;
        break;
      case Status.FAILURE:
        //handle smth if have
        return response;
        break;
      default:
        return response;
    }
  }


}
