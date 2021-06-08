import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_river_pod/model/login_data.dart';
import 'package:login_river_pod/state/login_state.dart';
class LoginNotifier extends StateNotifier<LoginState> {

  LoginNotifier() : super(LoginState());

  Future<void> login(String username,String password) async {
    try {
      state = LoginState.loading();
     await Future.delayed(const Duration(milliseconds: 2000), () {});
     final loginData =  LoginData(username, password);
     await Future.delayed(const Duration(milliseconds: 2000), () {});
     state = LoginState.success(loginData);
    } catch (e) {
      state = LoginState.error(message: 'Error login');
    }
  }
}
