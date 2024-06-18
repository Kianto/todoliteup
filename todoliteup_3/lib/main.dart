import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoliteup/core/styles/app_themes.dart';
import 'package:todoliteup/features/recipes/models/recipe.dart';
import 'package:todoliteup/features/recipes/recipes_data.dart';
import 'package:todoliteup/features/recipes/views/pages/recipes_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      for (Recipe menuItem in RecipesData.dessertMenu) {
        precacheImage(Image.asset(menuItem.image).image, context);
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return MaterialApp(
      title: 'Recipes UI Demo',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.main(),
      home: const RecipesPage(),
    );
  }
}
