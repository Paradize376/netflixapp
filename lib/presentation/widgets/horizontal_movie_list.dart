import 'package:flutter/material.dart';

class HorizontalMovieList extends StatelessWidget {
  const HorizontalMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            color: Colors.grey[800],
            child: Image.asset('assets/images/Group 26.png'), 
          );
        },
      ),
    );
  }
}
