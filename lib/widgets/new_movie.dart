import 'package:flutter/material.dart';

class NewMovieupdate extends StatelessWidget {
  const NewMovieupdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, 'moviePage');
        },
        child: Container(
          margin: const EdgeInsets.only(left: 10),
          height: 300,
          width: 150,
          color: Colors.blue,
          child: const Text('BLUE'),
        ),
      ),
    );
  }
}
