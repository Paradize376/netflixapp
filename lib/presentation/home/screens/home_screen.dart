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
  final Map<String, List<String>> sectionImages = {
    'Continue Watching for Eron': [
      'assets/images/m5.png',
      'assets/images/m6.png',
      'assets/images/m6.png',
      'assets/images/m6.png',
      
    ],
    'My List': [
      'assets/images/m7.png',
      'assets/images/m8.png',
      'assets/images/m6.png',
      'assets/images/m6.png',
    ],
    'Gems for You': [
      'assets/images/m9.png',
      'assets/images/m5.png',
      'assets/images/m6.png',
      'assets/images/m6.png',
    ],
    'Romance/Drama': [
      'assets/images/m6.png',
      'assets/images/m7.png',
      'assets/images/m6.png',
      'assets/images/m6.png',
    ],
    'Action/Thriller': [
      'assets/images/m8.png',
      'assets/images/m9.png',
      'assets/images/m6.png',
      'assets/images/m6.png',
    ],
  };

  late final List<Map<String, dynamic>> sections = [
    {
      'title': 'Continue Watching for Eron',
      'widget': HorizontalMovieList(
        imagePaths: sectionImages['Continue Watching for Eron']!,
      ),
    },
    {
      'title': 'My List',
      'widget': HorizontalMovieList(imagePaths: sectionImages['My List']!),
    },
    {'banner': const NetflixShopBannerWithSlider()},
    {
      'title': 'Gems for You',
      'widget': HorizontalMovieList(imagePaths: sectionImages['Gems for You']!),
    },
    
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: HeaderBanner()),
          ...sections
              .map((section) {
                if (section.containsKey('banner')) {
                  return SliverToBoxAdapter(child: section['banner']);
                }
                return Column(
                  children: [
                    SectionTitle(title: section['title']),
                    section['widget'],
                  ],
                );
              })
              .expand((widget) {
                if (widget is Column) {
                  return widget.children.map(
                    (child) => SliverToBoxAdapter(child: child),
                  );
                }
                return [widget];
              })
              .toList(),
        ],
      ),
    );
  }
}
