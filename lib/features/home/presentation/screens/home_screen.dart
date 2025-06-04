import 'package:flutter/material.dart';
import 'package:netflixapp/shared/widgets/netflix_shop_banner.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../shared/widgets/horizontal_movie_list.dart';
import '../../../../shared/widgets/header_banner.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Map<String, dynamic>>> fetchSections() async {
    final response = await http.post(
      Uri.parse('https://crmotions.ibusiness.co.th/netfixapi/api/movie'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({}),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return List<Map<String, dynamic>>.from(data['data']);
    } else {
      throw Exception('Failed to load sections');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: HeaderBanner()),
          SliverToBoxAdapter(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchSections(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Skeleton Loading
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        width: 180,
                        height: 24,
                        color: Colors.grey[800],
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 6,
                          itemBuilder:
                              (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4.0,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Container(
                                    width: 120,
                                    color: Colors.grey[900],
                                  ),
                                ),
                              ),
                        ),
                      ),
                    ],
                  );
                }
                if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                }
                final sections = snapshot.data!;

                final allImages =
                    sections
                        .map<String>((e) => e['mainImage'] as String)
                        .toList();

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SectionTitle(title: 'Contiune Watching for Eron'),
                    ),
                    HorizontalMovieList(imagePaths: allImages),
                    const NetflixShopBannerWithSlider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalMovieList extends StatelessWidget {
  final List<String> imagePaths;

  const HorizontalMovieList({super.key, required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imagePaths[index],
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, color: Colors.red),
              ),
            ),
          );
        },
      ),
    );
  }
}
