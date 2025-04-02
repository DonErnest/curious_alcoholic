import 'package:curious_alcoholic/models/cocktail.dart';
import 'package:curious_alcoholic/widgets/canvas.dart';
import 'package:curious_alcoholic/widgets/ingredient_card.dart';
import 'package:flutter/material.dart';

class CocktailDetails extends StatelessWidget {
  final Cocktail drink;

  const CocktailDetails({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    List<Widget> ingredientCards = [];
    for (var ingredient in drink.ingredients) {
      ingredientCards.add(IngredientCard(ingredient: ingredient));
    }

    return ScreenCanvas(
      widgets: [
        Expanded(
          child: ListView(
            children: [
              Text(drink.name),
              Divider(),
              Text("Instructions:"),
              Text(drink.instructions),
              Divider(),
              Text("Ingredients:"),
              ...ingredientCards,
            ],
          ),
        ),
      ],
    );
  }
}
