class Cocktail {
  final String id;
  final String name;
  final String category;
  final String instructions;
  final String? image;
  final String thumbnail;
  final List<String> ingredients;


  factory Cocktail.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    json.removeWhere((key, value) => value == null);

    for (var key in json.keys.where((key) => key.contains("strIngredient"))) {
      ingredients.add(json[key]);
    }

    return Cocktail(
      id: json["idDrink"],
      name: json["strDrink"],
      category: json["strCategory"],
      instructions: json["strInstructions"],
      image: json.containsKey("strImageSource")? json["strImageSource"] : null,
      thumbnail: json["strDrinkThumb"],
      ingredients: ingredients,
    );
  }

  const Cocktail({
    required this.id,
    required this.name,
    required this.category,
    required this.instructions,
    required this.image,
    required this.thumbnail,
    required this.ingredients,
  });
}
