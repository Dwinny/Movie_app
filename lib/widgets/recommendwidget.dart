import 'package:flutter/material.dart';

class RecommendWidget extends StatelessWidget {
  const RecommendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recommended',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'See All',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 300,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding: EdgeInsets.all(20),
                children: [
                  RecommendedMovies(Colors.blue),
                  RecommendedMovies(Colors.red),
                  RecommendedMovies(Colors.green),
                  RecommendedMovies(Colors.purple),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class RecommendedMovies extends StatelessWidget {
  final Color colors;
  RecommendedMovies(this.colors);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: colors),
    );
  }
}
