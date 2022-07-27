class LoginModel {
  String ?accessToken;

  LoginModel({this.accessToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
  }


}