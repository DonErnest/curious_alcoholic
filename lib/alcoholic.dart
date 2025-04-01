import 'package:curious_alcoholic/screens/main.dart';
import 'package:flutter/material.dart';

class CuriousAlcoholic extends StatefulWidget {
  const CuriousAlcoholic({super.key});

  @override
  State<CuriousAlcoholic> createState() => _CuriousAlcoholicState();
}

class _CuriousAlcoholicState extends State<CuriousAlcoholic> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: Text("Curious Alcoholic")),
          body: MainScreen(),
    ));
  }
}
