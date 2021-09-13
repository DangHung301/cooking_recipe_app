class Recipes{
  bool vegan;
  int? aggregateLikes;
  int? id;
  String? title;
  int? readyInMinutes;
  String? image;
  String? summary;


  Recipes({required this.vegan, required this.aggregateLikes, this.id, this.title,
      required this.readyInMinutes, this.image, this.summary});

  factory Recipes.fromJson(Map<String, dynamic> json){
    return Recipes(
      vegan: json['vegan'],
      aggregateLikes: json['aggregateLikes'],
      id: json['id'],
      title: json['title'],
      readyInMinutes: json['readyInMinutes'],
      image: json['image'],
      summary: json['summary'],
    );
  }
}