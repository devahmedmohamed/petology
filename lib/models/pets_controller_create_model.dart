class PetsModel {
  Pet? pet;

  PetsModel({this.pet});

  PetsModel.fromJson(Map<String, dynamic> json) {
    pet = json['pet'] != null ? new Pet.fromJson(json['pet']) : null;
  }


}

class Pet {
  String? name;
  int? year;
  int? month;
  String? size;
  String? breed;
  bool? gender;
  String? hairLength;
  String? color;
  String? careBehavior;
  bool? houseTrained;
  String? description;
  String? location;
  String? phone;
  bool? vaccinated;
  int? categoryId;
  List<String>? image;

  Pet(
      {this.name,
        this.year,
        this.month,
        this.size,
        this.breed,
        this.gender,
        this.hairLength,
        this.color,
        this.careBehavior,
        this.houseTrained,
        this.description,
        this.location,
        this.phone,
        this.vaccinated,
        this.categoryId,
        this.image});

  Pet.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    year = json['year'];
    month = json['month'];
    size = json['size'];
    breed = json['breed'];
    gender = json['gender'];
    hairLength = json['hairLength'];
    color = json['color'];
    careBehavior = json['careBehavior'];
    houseTrained = json['houseTrained'];
    description = json['description'];
    location = json['location'];
    phone = json['phone'];
    vaccinated = json['vaccinated'];
    categoryId = json['categoryId'];
    image = json['image'].cast<String>();
  }


}