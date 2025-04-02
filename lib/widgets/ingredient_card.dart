import 'package:curious_alcoholic/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  final String ingredient;

  const IngredientCard({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(getIngredientThumbnail(ingredient)),
          Text(ingredient),
        ],
      ),
    );
  }
}
