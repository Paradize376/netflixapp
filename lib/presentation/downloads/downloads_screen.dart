import 'package:flutter/material.dart';

class DownloadsScreen extends StatelessWidget {
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
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Downloads',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 0, 8),
                    child: Text(
                      'Season 1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  _EpisodeTile(
                    episodeNumber: 1,
                    title: 'Episode 1',
                    duration: '58m',
                    description:
                        'Sgt. David Budd is promoted to a protection detail for UK Home Secretary Julia Montague, but he quickly clashes with the hawkish politician.',
                    imageUrl: 'assets/images/m1.png',
                    isDownloaded: true,
                  ),
                  _EpisodeTile(
                    episodeNumber: 2,
                    title: 'Episode 2',
                    duration: '58m',
                    description:
                        'After an attempted attack on the school Budd’s kids attend, Montague worries about leaks in the department. But she may be in the line of fire herself.',
                    imageUrl: 'assets/images/m1.png',
                    isDownloaded: true,
                  ),
                  _EpisodeTile(
                    episodeNumber: 3,
                    title: 'Episode 3',
                    duration: '57m',
                    description:
                        'Montague’s public standing sours further. As Budd feels mounting pressure to spy on her, investigators question his statement about the shooting.',
                    imageUrl: 'assets/images/m1.png',
                    isDownloaded: false,
                  ),
                  _EpisodeTile(
                    episodeNumber: 4,
                    title: 'Episode 4',
                    duration: '57m',
                    description:
                        'In the wake of another attack, investigators grow suspicious of Budd’s involvement.',
                    imageUrl: 'assets/images/m1.png',
                    isDownloaded: false,
                  ),
                  _EpisodeTile(
                    episodeNumber: 5,
                    title: 'Episode 5',
                    duration: '57m',
                    description:
                        'Montague’s public standing sours further. As Budd feels mounting pressure to spy on her, investigators question his statement about the shooting.',
                    imageUrl: 'assets/images/m1.png',
                    isDownloaded: false,
                  ),
                  _EpisodeTile(
                    episodeNumber: 6,
                    title: 'Episode 6',
                    duration: '57m',
                    description:
                        'Montague’s public standing sours further. As Budd feels mounting pressure to spy on her, investigators question his statement about the shooting.',
                    imageUrl: 'assets/images/m1.png',
                    isDownloaded: false,
                  ),
                  _EpisodeTile(
                    episodeNumber: 7,
                    title: 'Episode 7',
                    duration: '57m',
                    description:
                        'Montague’s public standing sours further. As Budd feels mounting pressure to spy on her, investigators question his statement about the shooting.',
                    imageUrl: 'assets/images/m1.png',
                    isDownloaded: false,
                  ),

                 

                ],
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
                      ? Image.asset(imageUrl, width: 120, height: 70, fit: BoxFit.cover)
                      : Image.network(imageUrl, width: 120, height: 70, fit: BoxFit.cover),
                  Icon(Icons.play_circle_outline, color: Colors.white, size: 36),
                ],
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$episodeNumber. $title',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      duration,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
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
          SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }
}