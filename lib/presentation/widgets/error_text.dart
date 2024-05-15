import 'package:flutter/material.dart';
import 'package:search_recipe_app_getx/utils/colors.dart';


class ErrorText extends StatelessWidget {
  const ErrorText({
    super.key,required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          message,
          style: const TextStyle(color: redColor,fontSize: 20,fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}