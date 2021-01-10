class Skin {
  String id;
  int nume;
  String name;

  Skin({
    this.id,
    this.nume,
    this.name,
  });

  factory Skin.fromJson(Map<String, dynamic> json) {
    return Skin(
      id: json['id'],
      nume: json['num'],
      name: json['name'],
    );
  }
}
