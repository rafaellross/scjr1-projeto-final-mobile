import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  static const String id = '/home_screen';
  const HomeScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Menu Inicial',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
