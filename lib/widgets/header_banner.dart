import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: Colors.transparent,
      child: Row(
        children: [
          Image.asset('assets/images/icon.png', width: 40, height: 40),

          const SizedBox(width: 12),

          Expanded(
            child: Container(
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.white70),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ),
          ),

          const SizedBox(width: 12),

          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
            child: IconButton(
              icon: Image.asset(
                'assets/images/Mask Group.png',
                width: 50,
                height: 50,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderBanner extends StatelessWidget {
  const HeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/strangerthing.png',
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.6,
          fit: BoxFit.cover,
        ),

        // แทรก TopBar ด้านบนสุด
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SafeArea(child: TopBar()),
        ),

        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Stranger\nThings',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          iconSize: 28,
                          color: Colors.white,
                          onPressed: () {},
                          icon: const Icon(Icons.check),
                        ),
                        const Text(
                          'My List',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),

                    const SizedBox(width: 30),

                    ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 8,
                        ),
                      ),
                      icon: const Icon(Icons.play_arrow, color: Colors.black),
                      label: const Text(
                        'Play',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(width: 30),

                    Column(
                      children: [
                        IconButton(
                          iconSize: 28,
                          color: Colors.white,
                          onPressed: () {},
                          icon: const Icon(Icons.info_outline),
                        ),
                        const Text(
                          'Info',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
