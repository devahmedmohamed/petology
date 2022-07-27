class SendFilterModel {
  List<String>? breed;
  List<String>? ages;
  List<String>? size;
  List<String>? goodWith;
  Gender? gender;
  List<String>? colors;
  List<String>? hairLength;
  List<String>? behaviour;

  SendFilterModel(
      {this.breed,
        this.ages,
        this.size,
        this.goodWith,
        this.gender,
        this.colors,
        this.hairLength,
        this.behaviour});

  SendFilterModel.fromJson(Map<String, dynamic> json) {
    breed = json['breed'].cast<String>();
    ages = json['ages'].cast<String>();
    size = json['size'].cast<String>();
    goodWith = json['goodWith'].cast<String>();
    gender =
    json['gender'] != null ? new Gender.fromJson(json['gender']) : null;
    colors = json['colors'].cast<String>();
    hairLength = json['hairLength'].cast<String>();
    behaviour = json['behaviour'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['breed'] = this.breed;
    data['ages'] = this.ages;
    data['size'] = this.size;
    data['goodWith'] = this.goodWith;
    if (this.gender != null) {
      data['gender'] = this.gender!.toJson();
    }
    data['colors'] = this.colors;
    data['hairLength'] = this.hairLength;
    data['behaviour'] = this.behaviour;
    return data;
  }
}

class Gender {
  int? male;
  int? female;

  Gender({this.male, this.female});

  Gender.fromJson(Map<String, dynamic> json) {
    male = json['male'];
    female = json['female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['male'] = this.male;
    data['female'] = this.female;
    return data;
  }
}