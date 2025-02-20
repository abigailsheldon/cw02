import 'package:flutter/material.dart';
import '../models/recipe.dart';

class DetailsScreen extends StatelessWidget {
  final Recipe recipe;
  final Function(Recipe) toggleFavorite;

  const DetailsScreen({super.key, required this.recipe, required this.toggleFavorite});

  @override
  Widget build(BuildContext context) {
  
  }

}