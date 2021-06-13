class LoginResponse {
  String firstName;
  String lastName;
  String profilePicPath;

  LoginResponse({this.firstName, this.lastName, this.profilePicPath});



  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        firstName: json['firstName'],
        lastName: json['lastName'],
        profilePicPath: json['profilePicPath']);
  }
}
