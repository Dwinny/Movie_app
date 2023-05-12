import 'package:flutter/material.dart';

class NewMovie extends StatelessWidget {
  const NewMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'New Movies',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500),
        ),
        Text(
          'See All',
          style: TextStyle(color: Colors.white54, fontSize: 16),
        )
      ],
    );
  }
}
