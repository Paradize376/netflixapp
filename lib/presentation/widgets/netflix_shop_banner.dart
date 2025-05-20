import 'package:flutter/material.dart';

class NetflixShopBannerWithSlider extends StatelessWidget {
  final VoidCallback? onShopPressed;

  const NetflixShopBannerWithSlider({super.key, this.onShopPressed});

  final List<String> images = const [
    'assets/images/m1.png',
    'assets/images/m2.png',
    'assets/images/m3.png',
    'assets/images/m4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF99060D),
            Color(0xFF300112),
            Color(0xFF0C0013),
            Color(0xFF000000),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.7),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/icon.png',
                      width: 40,
                      height: 40,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Shop',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Text(
                    'Exclusive limited editions of carefully selected high-quality apparel and lifestyle products tied to our shows and brand on a regular basis',
                    style: const TextStyle(color: Colors.white, fontSize: 12
                        , fontWeight: FontWeight.normal
                        ),
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                      Colors.white,
                    ),
                    foregroundColor: WidgetStateProperty.all<Color>(
                      Colors.black,
                    ),
                    padding: WidgetStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    elevation: WidgetStateProperty.all<double>(2),
                  ),
                  onPressed: onShopPressed,
                  child: const Text(
                    'Go to shop',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            flex: 6,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              padding: EdgeInsets.only(left: 8),
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      index == images.length - 1
                          ? const EdgeInsets.only(left: 8)
                          : const EdgeInsets.only(left: 8, right: 0),
                  width: 140,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.lock, color: Colors.white, size: 14),
                              SizedBox(width: 4),
                              Text(
                                'SHOP',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
