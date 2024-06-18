import 'package:flutter/material.dart';
import 'package:todoliteup/playground/animated_scroll_view/animated_scroll_view_item.dart';
import 'package:todoliteup/playground/animated_scroll_view/list_item.dart';

class AnimatedHorizontalListView extends StatelessWidget {
  const AnimatedHorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        cacheExtent: 0,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
        itemCount: 100,
        itemBuilder: (context, index) {
          return const AnimatedScrollViewItem(
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: SizedBox(
                width: 100,
                child: ListItem(),
              ),
            ),
          );
        },
      ),
    );
  }
}
