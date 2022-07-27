class ServicesModel {
  double? categoryId;
  String? imageBase64;
  String? location;
  String? phoneNumber;

  ServicesModel(
      {this.categoryId, this.imageBase64, this.location, this.phoneNumber});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    imageBase64 = json['imageBase64'];
    location = json['location'];
    phoneNumber = json['phoneNumber'];
  }


}