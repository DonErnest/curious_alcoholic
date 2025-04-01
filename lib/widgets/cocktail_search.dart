import 'package:flutter/material.dart';

class CocktailSearch extends StatefulWidget {
  final void Function(String cocktailName) onCocktailSearch;

  const CocktailSearch({super.key, required this.onCocktailSearch});

  @override
  State<CocktailSearch> createState() => _CocktailSearchState();
}

class _CocktailSearchState extends State<CocktailSearch> {
  var searchController = TextEditingController();
  String? searchedCocktailName;

  Future<void> search() async {
    if (searchedCocktailName != null) {
      widget.onCocktailSearch(searchedCocktailName!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              controller: searchController,
              maxLines: 1,
              keyboardType: TextInputType.text,
              onChanged: (value) => setState(() => searchedCocktailName = value),
              decoration: const InputDecoration(
                label: Text("Enter name of the cocktail"),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(onPressed: search, icon: Icon(Icons.search)),
          ),
        ],
      ),
    );
  }
}