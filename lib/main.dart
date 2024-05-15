import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_recipe_app_getx/presentation/screens/search_screen.dart';
import 'package:search_recipe_app_getx/utils/app_context.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: GlobalContext.navigatorKey,
      title: 'Food Recipes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "IBM Plex Sans Thai",
        primarySwatch: Colors.blue,
      ),
      home:  SearchScreen(),
    );
  }
}
