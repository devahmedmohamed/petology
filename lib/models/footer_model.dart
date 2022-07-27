class FooterModel {
  String? email;
  String? location;
  String? phone;
  String? location2;

  FooterModel({this.email, this.location, this.phone, this.location2});

  FooterModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    location = json['location'];
    phone = json['phone'];
    location2 = json['location2'];
  }

}
