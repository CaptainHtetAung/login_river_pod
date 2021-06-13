import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_river_pod/model/login_data.dart';
import 'package:login_river_pod/request/login_request.dart';
import 'package:login_river_pod/state/login_state.dart';
import 'package:login_river_pod/usecases/login_usecase.dart';

import '../app_result.dart';
class LoginNotifier extends StateNotifier<LoginState> {

  LoginUseCase loginUseCase;


  LoginNotifier({this.loginUseCase}): super(LoginState());

  Future<void> login(String username,String password) async {
    try {
      state = LoginState.loading();
      final loginRequest = LoginRequest(username, password);
      var response =await loginUseCase.execute(loginRequest: loginRequest);
      switch(response.status){
        case Status.SUCCESS :{

          final loginData =  LoginData(username, password);
          //can use response.data
          state = LoginState.success(loginData);

        }break;
        case Status.FAILURE :{
          state = LoginState.error(message: response.message);

        }

      }
    } catch (e) {
      state = LoginState.error(message: 'Error login');
    }
  }
}
