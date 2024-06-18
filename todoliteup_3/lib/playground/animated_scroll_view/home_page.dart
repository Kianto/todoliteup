import 'package:flutter/material.dart';
import 'package:todoliteup/playground/animated_scroll_view/animated_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        bottom: false,
        child: AnimatedListView(),
      ),
    );
  }
}
