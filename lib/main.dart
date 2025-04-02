import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sistem_kelas/screens/home/home_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistem Kelas',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xff88c0d0),
          onPrimary: Color(0xffeceff4),
          secondary: Color(0xff81a1c1),
          onSecondary: Color(0xffeceff4),
          error: Color(0xffbf616a),
          onError: Color(0xffeceff4),
          surface: Color(0xffeceff4),
          onSurface: Color(0xff2e3440),
        ),
      ),
      home: const HomePage(),
    );
  }
}
