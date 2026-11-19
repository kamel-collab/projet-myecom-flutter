import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'screens/detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My E-Commerce',

      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),

      home: const MainScreen(),

      // Déclaration des routes
      routes: {
        DetailScreen.routeName: (context) => const DetailScreen(),
      },
    );
  }
}