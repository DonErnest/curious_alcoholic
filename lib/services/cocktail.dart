
import 'package:curious_alcoholic/api.dart';
import 'package:curious_alcoholic/models/cocktail.dart';

Future<List<Cocktail>> getSearchedCocktails(String name) async {
  final rawData = await searchCocktail(name);
  if (rawData != null && rawData.length != 0) {
    return List<Cocktail>.from(
      rawData.map((json) => Cocktail.fromJson(json)).toList(),
    );
  }
  return [];
}
