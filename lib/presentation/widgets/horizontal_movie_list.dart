import 'package:flutter/material.dart';

class HorizontalMovieList extends StatelessWidget {
  const HorizontalMovieList({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> imagePaths = [
      'assets/images/m5.png',
      'assets/images/m6.png', 
      'assets/images/m7.png',
      'assets/images/m8.png',
      'assets/images/m9.png',

    ];

    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            color: Colors.grey[800],
            child: Image.asset(imagePaths[index]), // ใช้ index เพื่อเลือกภาพ
          );
        },
      ),
    );
  }
}