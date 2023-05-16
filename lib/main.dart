import 'package:flutter/material.dart';
import 'Screens/Homepage.dart';
import 'Screens/categoryPage.dart';
import 'Screens/moviepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFF0F111D)),
      //home: HomePage()

      routes: {
        "/": (context) => HomePage(),
        "categoryPage": (context) => CategoryPage(),
        "moviePage": (context) => MoviePage(),
      }));
}
