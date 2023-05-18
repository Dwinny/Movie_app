import 'package:flutter/material.dart';

class Textformfield extends StatelessWidget {
  const Textformfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: const Color(0xFF292B37), borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        decoration: const InputDecoration(
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
