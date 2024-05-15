import 'package:flutter/material.dart';
import 'package:search_recipe_app_getx/utils/colors.dart';

class RecipeTextWidget extends StatelessWidget {
  const RecipeTextWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        title, // recipe name
        style: const TextStyle(
            color: whiteColor,
            fontSize: 18,
            fontWeight: FontWeight.w700
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}