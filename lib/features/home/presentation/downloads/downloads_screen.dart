import 'package:flutter/material.dart';

// Episode Model
class Episode {
  final int number;
  final String title;
  final String duration;
  final String description;
  final String imageUrl;
  final bool isDownloaded;

  const Episode({
    required this.number,
    required this.title,
    required this.duration,
    required this.description,
    required this.imageUrl,
    required this.isDownloaded,
  });
}

class DownloadsScreen extends StatelessWidget {
  final List<Episode> episodes = List.generate(10, (index) {
    final number = index + 1;
    return Episode(
      number: number,
      title: 'Episode $number',
      duration: '57m',
      description:
          'Montague’s public standing sours further. As Budd feels mounting pressure to spy on her, investigators question his statement about the shooting.',
      imageUrl: 'assets/images/m1.png',
      isDownloaded: number <= 2,
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.black.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      'Downloads',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: episodes.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return const Padding(
                      padding: EdgeInsets.fromLTRB(16, 16, 0, 8),
                      child: Text(
                        'Season 1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }

                  final e = episodes[index - 1];
                  return _EpisodeTile(
                    episodeNumber: e.number,
                    title: e.title,
                    duration: e.duration,
                    description: e.description,
                    imageUrl: e.imageUrl,
                    isDownloaded: e.isDownloaded,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EpisodeTile extends StatelessWidget {
  final int episodeNumber;
  final String title;
  final String duration;
  final String description;
  final String imageUrl;
  final bool isDownloaded;

  const _EpisodeTile({
    required this.episodeNumber,
    required this.title,
    required this.duration,
    required this.description,
    required this.imageUrl,
    required this.isDownloaded,
  });

  @override
  Widget build(BuildContext context) {
    final bool isAsset = imageUrl.startsWith('assets/');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  isAsset
                      ? Image.asset(
                        imageUrl,
                        width: 120,
                        height: 70,
                        fit: BoxFit.cover,
                      )
                      : Image.network(
                        imageUrl,
                        width: 120,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                  const Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                    size: 36,
                  ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$episodeNumber. $title',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      duration,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Icon(
                isDownloaded ? Icons.check_box : Icons.download,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
