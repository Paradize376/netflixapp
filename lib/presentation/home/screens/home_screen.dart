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