import 'package:flutter/material.dart';
import 'package:todoliteup/core/widgets/animate_in_effect.dart';
import 'package:todoliteup/features/instructions/views/widgets/instruction_item.dart';
import 'package:todoliteup/features/recipes/models/recipe.dart';

class InstructionsSection extends StatelessWidget {
  const InstructionsSection(
    this.recipe, {
    super.key,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recipe.instructions.length,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return AnimateInEffect(
          keepAlive: true,
          intervalStart: i / recipe.instructions.length,
          child: InstructionItem(
            recipe,
            index: i,
          ),
        );
      },
    );
  }
}
