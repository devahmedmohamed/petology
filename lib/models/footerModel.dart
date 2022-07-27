class footerModel {
  String? email;
  String? location;
  String? phone;
  String? location2;

  footerModel({this.email, this.location, this.phone, this.location2});

  footerModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    location = json['location'];
    phone = json['phone'];
    location2 = json['location2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = email;
    data['location'] = location;
    data['phone'] = phone;
    data['location2'] = location2;
    return data;
  }
}
