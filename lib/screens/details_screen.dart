import 'package:flutter/material.dart';
import '../models/recipe.dart';

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;
  final Function(Recipe) toggleFavorite;

  const DetailsScreen({super.key, required this.recipe, required this.toggleFavorite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ingredients:', style: Theme.of(context).textTheme.titleLarge),
            Text(recipe.ingredients, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 16),
            Text('Instructions:', style: Theme.of(context).textTheme.titleLarge),
            Text(recipe.instructions, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                toggleFavorite(recipe);
              },
              icon: Icon(recipe.isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
              label: Text(recipe.isFavorite ? "Unfavorite" : "Favorite"),
            ),
          ],
        ),
      ),
    );
  }

}