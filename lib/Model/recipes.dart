class Recipes {
  bool vegan;
  int aggregateLikes;
  int id;
  String title;
  int readyInMinutes;
  String? image;
  String summary;


  Recipes(
      {required this.vegan, required this.aggregateLikes, required this.id, required this.title,
        required this.readyInMinutes, this.image, required this.summary});

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

  factory Recipes.fromData(Map<String, dynamic> json){
    return Recipes(
      vegan: json['vegan'] == 1 ? true : false,
      aggregateLikes: json['aggregateLikes'],
      id: json['id'],
      title: json['title'],
      readyInMinutes: json['readyInMinutes'],
      image: json['image'],
      summary: json['summary'],
    );
  }

   Map<String, dynamic> toMap() {
    return {
      'vegan': vegan ? 1 : 0,
      'aggregateLikes': aggregateLikes,
      'id': id,
      'title': title,
      'readyInMinutes': readyInMinutes,
      'image': image,
      'summary': summary,
    };
  }
}