class OverviewRecipes {
  bool vegetarian;
  bool vegan;
  bool glutenFree;
  bool dairyFree;
  bool veryHealthy;
  bool cheap;
  int aggregateLikes;
  int readyInMinutes;
  int id;
  String image;
  String title;
  String summary;

  OverviewRecipes(
      {required this.vegetarian,
      required this.vegan,
      required this.glutenFree,
      required this.dairyFree,
      required this.veryHealthy,
      required this.cheap,
      required this.aggregateLikes,
      required this.readyInMinutes,
      required this.id,
      required this.image,
      required this.title,
      required this.summary});

  factory OverviewRecipes.fromJson(Map<String, dynamic> json) {
    return OverviewRecipes(
        vegetarian: json['vegetarian'],
        vegan: json['vegan'],
        glutenFree: json['glutenFree'],
        dairyFree: json['dairyFree'],
        veryHealthy: json['veryHealthy'],
        cheap: json['cheap'],
        aggregateLikes: json['aggregateLikes'],
        readyInMinutes: json['readyInMinutes'],
        id: json['id'],
        image: json['image'],
        title: json['title'],
        summary: json['summary']);
  }
}
