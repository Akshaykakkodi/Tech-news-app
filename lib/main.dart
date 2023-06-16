import 'package:flutter/material.dart';
import 'package:technewz/pages/home.dart';
import 'package:technewz/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primary,

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

