import 'package:flutter/material.dart';
import 'package:portfolio_website/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nayan Verma',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.black,
      ),

      debugShowCheckedModeBanner: false,
      home: const LandingPage(title: 'It Works!'),
    );
  }
}
