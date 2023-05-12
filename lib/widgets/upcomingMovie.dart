import 'package:flutter/material.dart';

class Moviewidget extends StatelessWidget {
  const Moviewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, 'moviePage');
        },
        child: Container(
          height: 180,
          width: 180,
          color: Colors.blue,
          child: Text('BLUE'),
        ),
      ),
    );
  }
}
