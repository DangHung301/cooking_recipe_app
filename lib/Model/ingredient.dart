class Ingredient {
  int id;
  String? image;
  String? name;
  String? original;

  Ingredient(
      {required this.id,
      required this.image,
      required this.name,
      required this.original});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
        id: json['id'],
        image: json['image'],
        name: json['name'],
        original: json['original']);
  }
}
