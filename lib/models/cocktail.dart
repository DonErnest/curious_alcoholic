class Cocktail {
  final String id;
  final String name;
  final String category;
  final String instructions;
  final String? image;
  final String thumbnail;

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
      id: json["idDrink"],
      name: json["strDrink"],
      category: json["strCategory"],
      instructions: json["strInstructions"],
      image: json["strImageSource"],
      thumbnail: json["strDrinkThumb"]
    );
  }

  const Cocktail({
    required this.id,
    required this.name,
    required this.category,
    required this.instructions,
    required this.image,
    required this.thumbnail,
  });
}
