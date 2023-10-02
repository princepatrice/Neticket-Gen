import 'package:flutter/material.dart';
import 'package:neticket/Frames/Home/index.dart';

void main() {
  runApp(const NeticketApp());
}

class NeticketApp extends StatelessWidget {
  const NeticketApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neticket',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white,
            background: Colors.orange),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}