import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/home/presentation/viewmodel/home_viewmodel.dart';
import 'features/home/presentation/downloads/downloads_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeViewModel())],
      child: MaterialApp(
        title: 'Netflix Clone',
        theme: ThemeData.dark(),
        home: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // สร้าง List ของหน้าจอแต่ละแท็บ
    final List<Widget> _screens = [
      HomeScreen(),
      Center(child: Text('Search', style: TextStyle(fontSize: 24))),
      DownloadsScreen(), // ใช้หน้าจอ Downloads จริง
      Center(child: Text('More', style: TextStyle(fontSize: 24))),
    ];

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Downloads',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
        ],
      ),
    );
  }
}
