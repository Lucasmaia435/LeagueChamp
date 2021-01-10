class Passive {
  String name;
  String description;
  String imgName;

  Passive({this.name, this.description, this.imgName});

  factory Passive.fromJson(Map<String, dynamic> json) {
    return Passive(
      name: json['name'],
      description: json['description'],
      imgName: json['image']['full'],
    );
  }
}
