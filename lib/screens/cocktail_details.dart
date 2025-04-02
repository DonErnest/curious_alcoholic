import 'package:curious_alcoholic/models/cocktail.dart';
import 'package:curious_alcoholic/widgets/canvas.dart';
import 'package:flutter/material.dart';

class CocktailDetails extends StatelessWidget {
  final Cocktail drink;
  const CocktailDetails({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(widgets: [
      Text(drink.name),
      Divider(),

      Text(drink.instructions)
    ]);
  }
}
