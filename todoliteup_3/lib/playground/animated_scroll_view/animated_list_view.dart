import 'package:flutter/material.dart';
import 'package:todoliteup/playground/animated_scroll_view/animated_scroll_view_item.dart';
import 'package:todoliteup/playground/animated_scroll_view/list_item.dart';

class AnimatedListView extends StatelessWidget {
  const AnimatedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      cacheExtent: 0,
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      itemCount: 100,
      itemBuilder: (context, index) =>
          const AnimatedScrollViewItem(child: ListItem()),
    );
  }
}
