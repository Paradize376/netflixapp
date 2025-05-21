import 'package:flutter/material.dart';
import 'package:netflixapp/widgets/netflix_shop_banner.dart';
import '../../../widgets/section_title.dart';
import '../../../widgets/horizontal_movie_list.dart';
import '../../../widgets/header_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> sectionTitles = [
    'Continue Watching for Eron',
    'My List',
    'Gems for You',
    'Romance/Drama',
    'Action/Thriller',
  ];

  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> sections = [
      {
        'title': 'My List',
        'widget': HorizontalMovieList(),
      },
      {
        'banner': NetflixShopBannerWithSlider(),
      },
      {
        'title': 'Gems for You',
        'widget': HorizontalMovieList(),
      },
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: HeaderBanner()),
          ...sections.map((section) {
            if (section.containsKey('banner')) {
              return SliverToBoxAdapter(child: section['banner']);
            }
            return Column(
              children: [
                SectionTitle(title: section['title']),
                section['widget'],
              ],
            );
          }).expand((widget) {
            // แปลง Column ให้เป็น SliverToBoxAdapter
            if (widget is Column) {
              return widget.children
                  .map((child) => SliverToBoxAdapter(child: child));
            }
            return [widget];
          }).toList(),
        ],
      ),
    );
  }
}
