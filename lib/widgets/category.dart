import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        height: 70,
        width: 90,
        //fit: BoxFit.cover
        color: Colors.blue,
        child: const Text('BLUE'),
      ),
    );
  }
}
