// lib/screens/splash_screen.dart

import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMain();
  }

  void _navigateToMain() async {
    await Future.delayed(Duration(seconds: 3), () {}); // Espera 3 segundos
    Navigator.pushReplacementNamed(context, '/categories'); // Redirige a categorías
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.newspaper, size: 100, color: Colors.white),
              const SizedBox(height: 20),
              Text(
                S.current.news,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
