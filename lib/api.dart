import 'dart:convert';

import 'package:http/http.dart';

final baseUri = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=";

final ingredientsBaseUri = "https://www.thecocktaildb.com/images/ingredients/";


Future<dynamic> searchCocktail(String name) async {
  final uri = Uri.parse("${baseUri}${name}");
  try {
    final response = await get(uri);
    if (response.statusCode == 200) {
      final dynamic jsonData = jsonDecode(response.body);
      return jsonData["drinks"];
    }
  } catch (error) {
    return null;
  }
}


String getIngredientThumbnail(String ingredientName) {
  String filename = "${ingredientName.toLowerCase()}-medium.png";
  return "${ingredientsBaseUri}${filename}";
}
