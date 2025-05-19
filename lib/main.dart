import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/home/screens/home_screen.dart';
import 'presentation/home/viewmodel/home_viewmodel.dart';

void main() {
  runApp(const MyApp());
}
        
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
   
      ],
      child: MaterialApp(
        title: 'Netflix Clone',
        theme: ThemeData.dark(),
        home: const HomeScreen(),
      ),
    );
  }
}
