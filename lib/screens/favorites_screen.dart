import 'package:flutter/material.dart';
import '../models/recipe.dart';
import 'details_screen.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Recipe> favoriteRecipes;
  final Function(Recipe) toggleFavorite;

  const FavoritesScreen({super.key, required this.favoriteRecipes, required this.toggleFavorite});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Recipes')),
      body: widget.favoriteRecipes.isEmpty
          ? const Center(child: Text('No favorite recipes yet.'))
          : ListView.builder(
              itemCount: widget.favoriteRecipes.length,
              itemBuilder: (context, index) {
                final recipe = widget.favoriteRecipes[index];
                return ListTile(
                  title: Text(recipe.name),
                  trailing: IconButton(
                    icon: Icon(
                      recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: recipe.isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.toggleFavorite(recipe); 
                      });
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          recipe: recipe,
                          toggleFavorite: (updatedRecipe) {
                            setState(() {
                              widget.toggleFavorite(updatedRecipe); 
                            });
                          },
                        ),
                      ),
                    ).then((_) => setState(() {})); 
                  },
                );
              },
            ),
    );
  }
}
