import 'package:flutter/material.dart';
import 'package:netflixapp/presentation/widgets/netflix_shop_banner.dart';

import '../../widgets/section_title.dart';
import '../../widgets/horizontal_movie_list.dart';

import '../../widgets/header_banner.dart';
import '../../widgets/custom_bottom_navigation_bar.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: HeaderBanner()),

          SliverToBoxAdapter(child: SectionTitle(title: 'Continue Watching for Eron'),),
          SliverToBoxAdapter(child: HorizontalMovieList()),

          SliverToBoxAdapter(child: SectionTitle(title: 'My List')),
        
          SliverToBoxAdapter(child: HorizontalMovieList()),
          SliverToBoxAdapter(child: NetflixShopBannerWithSlider()),

          SliverToBoxAdapter(child: SectionTitle(title: 'Gems for You')),
          SliverToBoxAdapter(child: HorizontalMovieList()),

          SliverToBoxAdapter(child: SectionTitle(title: 'Romance/Drama')),
          SliverToBoxAdapter(child: HorizontalMovieList()),

          SliverToBoxAdapter(child: SectionTitle(title: 'Action/Thriller')),
          SliverToBoxAdapter(child: HorizontalMovieList()),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
