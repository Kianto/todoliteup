import 'package:flutter/material.dart';
import 'package:todoliteup/playground/animated_scroll_view/animated_scroll_view_item.dart';
import 'package:todoliteup/playground/animated_scroll_view/list_item.dart';

class AnimatedGridView extends StatelessWidget {
  const AnimatedGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
      ),
      cacheExtent: 0,
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      itemCount: 200,
      itemBuilder: (context, index) {
        return const AnimatedScrollViewItem(child: ListItem());
      },
    );
  }
}
