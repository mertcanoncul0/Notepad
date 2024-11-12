import 'package:flutter/material.dart';
import 'package:mobile/core/constants.dart';
import 'package:mobile/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Poppins",
        scaffoldBackgroundColor: background,
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
              backgroundColor: Colors.transparent,
              titleTextStyle: const TextStyle(
                fontFamily: "Fredoka",
                color: primary,
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
      ),
      home: const MainPage(),
    );
  }
}
