import 'package:flutter/material.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Upcoming Movies',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        Text(
          'See All',
          style: TextStyle(color: Colors.white12),
        )
      ],
    );
  }
}
