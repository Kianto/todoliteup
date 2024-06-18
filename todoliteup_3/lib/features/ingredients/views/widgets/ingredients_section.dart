import 'package:flutter/material.dart';
import 'package:todoliteup/core/widgets/animate_in_effect.dart';
import 'package:todoliteup/features/ingredients/views/widgets/ingredient_item.dart';
import 'package:todoliteup/features/recipes/models/recipe.dart';

class IngredientsSection extends StatelessWidget {
  const IngredientsSection(
    this.recipe, {
    super.key,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recipe.ingredients.length,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return AnimateInEffect(
          keepAlive: true,
          intervalStart: i / recipe.ingredients.length,
          child: IngredientItem(
            recipe,
            ingredient: recipe.ingredients[i],
          ),
        );
      },
    );
  }
}
