import 'package:flutter/material.dart';

import 'package:sistem_kelas/src/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistem Kelas',
      themeMode: ThemeMode.system,
      home: const HomePage(title: "Sistem Kelas"),
    );
  }
}
