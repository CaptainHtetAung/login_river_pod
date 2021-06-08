import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:login_river_pod/model/login_data.dart';
part 'login_state.freezed.dart';

@freezed
abstract class LoginState  with _$LoginState{
  const factory LoginState() = Initial;
  const factory LoginState.loading() = Loading;
  const  factory LoginState.success(LoginData login)= LoginSuccess;
  const factory LoginState.error({String message}) = Error;
}