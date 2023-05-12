import 'package:flutter/material.dart';

class newMovieupdate extends StatelessWidget {
  const newMovieupdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, 'moviePage');
        },
        child: Container(
          margin: EdgeInsets.only(left: 10),
          height: 300,
          width: 150,
          color: Colors.blue,
          child: Text('BLUE'),
        ),
      ),
    );
  }
}
