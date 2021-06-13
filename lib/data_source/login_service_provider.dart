import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_river_pod/network/network.dart';
import 'package:login_river_pod/request/login_request.dart';
import 'package:login_river_pod/response/login_response.dart';

import '../app_result.dart';
abstract class LoginService {

  Future<AppResult> login({@required LoginRequest loginRequest});
}

class LoginServiceImpl implements LoginService {

  NetworkProvider _networkProvider;

  LoginServiceImpl({@required NetworkProvider networkProvider})
      : assert(networkProvider != null) {
    this._networkProvider = networkProvider;
  }



  @override
  Future<AppResult<LoginResponse>> login({LoginRequest loginRequest}) async {
    try {
      var response = await _networkProvider.doPost(
          url: "login api path", data: loginRequest.toJson());
      switch(response.statusCode){
        case 200:{
          return AppResult.success(LoginResponse.fromJson(response.data));
        }break;
        default:{
          return AppResult.failure("Unknown Error");

        }
      }
    } on Exception catch (error) {
      return AppResult.failure(error.toString());
    }
  }
}
