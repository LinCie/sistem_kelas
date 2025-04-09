import 'package:flutter/material.dart';
import 'package:sistem_kelas/screens/menu/menu_page.dart';

import 'package:sistem_kelas/screens/signin/signin_page.dart';
import 'package:sistem_kelas/shared/storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _isSignedIn();
  }

  Future<void> _isSignedIn() async {
    final storage = Storage();

    await Future.delayed(const Duration(seconds: 3));

    String? jwt = await storage.getToken();

    if (mounted) {
      if (jwt == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SignInPage()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const MenuPage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Cognito",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
