class petsNeedsModel {
  String? imageUrl;
  String? title;

  petsNeedsModel({this.imageUrl, this.title});

  petsNeedsModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = imageUrl;
    data['title'] = title;
    return data;
  }
}