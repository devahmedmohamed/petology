class aboutsModel {
  String? title;
  String? body;

  aboutsModel({this.title, this.body});

  aboutsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}