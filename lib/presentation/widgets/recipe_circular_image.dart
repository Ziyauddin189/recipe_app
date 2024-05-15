import 'package:flutter/material.dart';
import 'package:search_recipe_app_getx/utils/colors.dart';

class RecipeCircularImage extends StatelessWidget {
  const RecipeCircularImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: whiteColor),
      child: ClipOval(
        child: imageUrl.isNotEmpty ? Image.network(
          imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ) : const SizedBox.shrink()
      ),
    );
  }
}