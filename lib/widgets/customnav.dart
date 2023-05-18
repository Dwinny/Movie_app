import 'package:flutter/material.dart';

class Customnavbar extends StatelessWidget {
  const Customnavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(
          color: Color(0xFF292037),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              // Navigate to Home page
              Navigator.pushNamed(context, '/');
            },
            child: const Icon(
              Icons.home,
              size: 35,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'categoryPage');
            },
            child: const Icon(
              Icons.category,
              size: 35,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'moviePage');
            },
            child: const Icon(
              Icons.favorite_border,
              size: 35,
              color: Colors.white,
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.person,
              size: 35,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
