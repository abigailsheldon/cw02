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
      ingredients: 'Pasta, Parmesan, Tomato Sauce',
      instructions: "1. Boil pasta.\n2. Add cheese and sauce.",
    ),
    Recipe(
      name: 'Black Sesame Cookies',
      ingredients: 'Sugar, Butter, Flour, Almond Meal, Salt, Sesame Seeds, Egg Yolk',
      instructions: "1. Combine flour, almond meal, sugar, and salt.\n2. Add sesame seeds.\n3. Add butter and sugar.\n4. Chill the dough.\n5. Bake at 350 degrees for 10 minutes.",
    ),
    Recipe(
      name: 'Chicken Cacciatore',
      ingredients: 'Chicken Thigh, Olive Oil, Celery, Mushroom, Onion, Garlic, Tomato Paste, Chicken Bouillon, Pepper Flakes, Stewed Tomatoes',
      instructions: "1. Sauté chicken.\n2. Add remaining ingredients.\n3. Simmer.\n4. Serve with pasta or rice.",
    ),
    Recipe(
      name: 'Avocado Toast',
      ingredients: 'Bread, Avocado, Lemon, Salt, Garlic',
      instructions: '1. Toast bread.\n2. Mash avocado and add remaining ingredients.\n3. Season and spread avocado mixture.',
    ),
    Recipe(
      name: 'Egg Sandwich',
      ingredients: 'Egg, White Bread, Mayo, Milk, Sugar, Salt, Pepper',
      instructions: "1. Boil eggs.\n2. Peel and mash eggs.\n3. Add remaining ingredients.\n4. Spread egg mix on bread.",
    ),
  ];

  final List<Recipe> favoriteRecipes = [];

  void toggleFavorite(Recipe recipe) {
    setState(() {
      recipe.isFavorite = !recipe.isFavorite;
      if (recipe.isFavorite) {
        favoriteRecipes.add(recipe);
      } else {
        favoriteRecipes.removeWhere((fav) => fav.name == recipe.name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipe Book"),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return ListTile(
            title: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      recipe: recipe,
                      toggleFavorite: toggleFavorite, 
                    ),
                  ),
                ).then((_) => setState(() {})); 
              },
              child: Text(recipe.name),
            ),
            trailing: IconButton(
              icon: Icon(
                recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: recipe.isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                toggleFavorite(recipe);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.favorite),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoritesScreen(
                favoriteRecipes: favoriteRecipes,
                toggleFavorite: toggleFavorite,
              ),
            ),
          ).then((_) => setState(() {}));
        },
      ),
    );
  }
}
