import 'package:curious_alcoholic/models/cocktail.dart';
import 'package:curious_alcoholic/screens/cocktail_details.dart';
import 'package:curious_alcoholic/services/cocktail.dart';
import 'package:curious_alcoholic/widgets/canvas.dart';
import 'package:flutter/material.dart';

import '../widgets/cocktail_search.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Cocktail> cocktails = [];

  Future<void> searchCocktail(String name) async {
    print(name);
    var foundCocktails = await getSearchedCocktails(name);
    setState(() {
      cocktails = foundCocktails;
    });
  }

  void cocktailSelected(Cocktail cocktail) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (ctx) =>
          SafeArea(
              child: Scaffold(
                appBar: AppBar(title: Text(cocktail.name)),
                body: CocktailDetails(drink: cocktail)),
              ))
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenCanvas(
      widgets: [
        Expanded(
          child: CocktailSearch(onCocktailSearch: searchCocktail),
          flex: 1,
        ),
        Expanded(
          flex: 7,
          child: GridView.builder(
            itemCount: cocktails.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              mainAxisExtent: 300,
            ),
            itemBuilder:
                (ctx, idx) => InkResponse(
                  onTap: () {
                    cocktailSelected(cocktails[idx]);
                  },
                  child: GridTile(
                    header: GridTileBar(
                      title: Text(
                        cocktails[idx].name,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(12.0),
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        gradient: const RadialGradient(
                          colors: <Color>[Color(0x0F88EEFF), Color(0x2F0099BB)],
                        ),
                      ),
                      child: Image.network(cocktails[idx].thumbnail),
                    ),
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
