import 'package:flutter/material.dart';

class Textformfield extends StatelessWidget {
  const Textformfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Color(0xFF292B37), borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white54,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.white54),
        ),
      ),
    );
  }
}
