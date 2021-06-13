class LoginRequest {
  final String userName;
  final String password;

  const LoginRequest(
      this.userName, this.password);

  Map<String, dynamic> toJson() => <String, dynamic>{
        "UserName": userName,
        "UserPassword": password,
      };
}
