import 'package:flutter/material.dart';
import 'package:netflixapp/shared/widgets/netflix_shop_banner.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../shared/widgets/horizontal_movie_list.dart';
import '../../../../shared/widgets/header_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
<<<<<<< HEAD:lib/features/home/presentation/screens/home_screen.dart
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
=======
  final List<String> imagePool = [
    'assets/images/m5.png',
    'assets/images/m6.png',
    'assets/images/m7.png',
    'assets/images/m8.png',
    'assets/images/m9.png',
  ];

  final List<String> sectionTitles = [
    'Continue Watching for Eron',
    'My List',
    'Gems for You',
    'Romance/Drama',
    'Action/Thriller',
  ];

  late final Map<String, List<String>> sectionImages = {
    for (var title in sectionTitles)
      title: List.generate(5, (i) => imagePool[i % imagePool.length]),
  };

  List<Widget> _buildSliverSections() {
    final List<Widget> slivers = [];

    sectionImages.forEach((title, images) {
      slivers.addAll([
        SliverToBoxAdapter(child: SectionTitle(title: title)),
        SliverToBoxAdapter(child: HorizontalMovieList(imagePaths: images)),
      ]);
    });

    // เพิ่ม banner หลัง section 2
    slivers.insert(
      4,
      const SliverToBoxAdapter(child: NetflixShopBannerWithSlider()),
    );

    return slivers;
  }
>>>>>>> 3273c98da459bfdd92a70a7f347c51e6be960505:lib/presentation/home/screens/home_screen.dart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: HeaderBanner()),
          ..._buildSliverSections(),
        ],
      ),
    );
  }
}