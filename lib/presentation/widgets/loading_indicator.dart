import 'package:flutter/material.dart';
import 'package:search_recipe_app_getx/utils/colors.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color:primaryColor ,),
    );
  }
}