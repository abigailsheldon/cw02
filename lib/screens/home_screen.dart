import 'package:flutter/material.dart';
import 'details_screen.dart';
import '../models/recipe.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Recipe> recipes = [
    Recipe(
      name: 'Spaghetti', 
      ingredients: 'Pasta, Parmesan', 
      instructions: "1. Boil pasta\n2. Add cheese"),
    Recipe(
      name: 'Avocado Toast', 
      ingredients: 'Bread, Avocado, Lemon, Salt', 
      instructions: '1. Toast bread\n2. Mash avocado\n3. Season and spread.'),
  ];

  final List<Recipe> favoriteRecipes = [];

  void toggleFavorite(Recipe recipe) {
    setState(() {
      recipe.isFavorite = !recipe.isFavorite;
      if (recipe.isFavorite) {
        favoriteRecipes.add(recipe);
      } else {
        favoriteRecipes.remove(recipe);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

  }
  
}


