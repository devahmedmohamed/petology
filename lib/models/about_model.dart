class AboutsModel {
  String? title;
  String? body;

  AboutsModel({this.title, this.body});

  AboutsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
  }

}