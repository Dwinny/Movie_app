import 'package:flutter/material.dart';

import 'Screens/home_page.dart';
import 'Screens/category_page.dart';
import 'Screens/moviepage.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF0F111D)),
      //home: HomePage()

      routes: {
        "/": (context) => const HomePage(),
        "categoryPage": (context) => const CategoryPage(),
        "moviePage": (context) => const MoviePage(),
      }));
}
